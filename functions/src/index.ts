/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {setGlobalOptions} from "firebase-functions";
import {onRequest} from "firebase-functions/https";
// import * as logger from "firebase-functions/logger";

import * as admin from "firebase-admin";
import * as crypto from "crypto";


// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// For cost control, you can set the maximum number of containers that can be
// running at the same time. This helps mitigate the impact of unexpected
// traffic spikes by instead downgrading performance. This limit is a
// per-function limit. You can override the limit for each function using the
// `maxInstances` option in the function's options, e.g.
// `onRequest({ maxInstances: 5 }, (req, res) => { ... })`.
// NOTE: setGlobalOptions does not apply to functions using the v1 API. V1
// functions should each use functions.runWith({ maxInstances: 10 }) instead.
// In the v1 API, each function can only serve one request per container, so
// this will be the maximum concurrent request count.
setGlobalOptions({ maxInstances: 10 });

// Initialize Firebase Admin globally (runs once per container)
admin.initializeApp();
const db = admin.database(); 

// Simple SVG generator
function generateSvgBadge(views: number): string {
  const text = `views ${views}`;
  const width = Math.max(90, text.length * 8 + 20);
  
  return `
    <svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="20">
      <rect width="45" height="20" fill="#555"/>
      <rect x="45" width="${width - 45}" height="20" fill="#4c1"/>
      <g fill="#fff" text-anchor="middle" font-family="Verdana,sans-serif" font-size="11">
        <text x="22.5" y="14">views</text>
        <text x="${(width + 45) / 2}" y="14">${views}</text>
      </g>
    </svg>
  `.trim();
}

// Export a raw Firebase HTTP function (No Express)
export const badge = onRequest({ 
  maxInstances: 10,
  // minInstances: 1, // <-- Uncomment to completely eliminate cold starts
}, async (req, res) => {
  
  // 1. Get username from query string: /badge?user=yourname
  const username = req.query.user as string;
  if (!username) {
    res.status(400).send("Missing user parameter");
    return;
  }

  // 2. Extract traits for deduplication
  const ip = (req.headers["x-forwarded-for"] as string)?.split(',')[0] || req.socket.remoteAddress || "unknown";
  const userAgent = req.headers["user-agent"] || "";
  
  const visitorHash = crypto
    .createHash("sha256")
    .update(`${username}:${ip}:${userAgent}`)
    .digest("hex");

  const viewsRef = db.ref(`views/${username}/count`);
  const dedupRef = db.ref(`views/${username}/visitors/${visitorHash}`);

  try {
    // 3. Check if visitor is already logged
    const snapshot = await dedupRef.once("value");
    let currentViews = 0;

    if (!snapshot.exists()) {
      // Not a duplicate: Increment count atomically and log visitor
      await Promise.all([
        viewsRef.set(admin.database.ServerValue.increment(1)),
        dedupRef.set(Date.now()) // Store timestamp of visit
      ]);
      
      // Fetch the newly incremented count
      const newCountSnap = await viewsRef.once("value");
      currentViews = newCountSnap.val() || 1;
    } else {
      // Duplicate: Just fetch the existing count
      const countSnap = await viewsRef.once("value");
      currentViews = countSnap.val() || 0;
    }

    // 4. Set anti-cache headers for GitHub Camo
    res.setHeader("Content-Type", "image/svg+xml");
    res.setHeader("Cache-Control", "max-age=0, no-cache, no-store, must-revalidate");
    
    res.status(200).send(generateSvgBadge(currentViews));
  } catch (error) {
    console.error(error);
    res.setHeader("Content-Type", "image/svg+xml");
    res.status(200).send(generateSvgBadge(0)); // Fail gracefully
  }
});
