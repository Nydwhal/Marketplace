<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'label',
        'description',
        'initial_price',
        "current_price",
        "start_date",
        "end_date",
        'state',
        'image',
        'owner_id',
        'client_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function client()
    {
        return $this->belongsTo(User::class, 'client_id');
    }
}
