import { db } from '../../../db.js';
import { json } from '@sveltejs/kit';

export async function DELETE({ request }) {
  try {
    const { id } = await request.json();
    console.log(id);
    await db.promise().query('DELETE FROM tasks WHERE id = ?', [id]);
    return json({});
  } catch (error) {
    return {
      status: 500,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        error: 'Internal delete Server Error'
      }
    };
  }
}