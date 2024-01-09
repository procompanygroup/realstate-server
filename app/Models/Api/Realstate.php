<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Realstate extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'desc',
        'realmodel',
        'periodtime',
        'price',
        'location',
        'owner',
        'userid',
        'image',
        'category',
        'isFavorite',

    ];
}
