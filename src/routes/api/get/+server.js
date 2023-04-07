import { db } from '../../../db.js';

import { json } from '@sveltejs/kit';

export async function GET() {
  try {
    const [rows] = await db.promise().query('SELECT * FROM tasks');
    return json(rows);
  } catch (error) {
    return {
      status: 500,
      body: {
        error: 'Internal get Server Error'
      }
    };
  }
}