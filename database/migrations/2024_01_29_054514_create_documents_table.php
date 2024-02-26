<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->id();
            $table->json('upload_documents', 2048)->nullable();
            $table->string('forward', 2048)->nullable();
            $table->string('from', 2048)->nullable();
            $table->string('message', 2048)->nullable();
            $table->string('remarks', 2048)->nullable();
            $table->string('status', 2048)->nullable();
            $table->datetime('published_at')->nullable();
            $table->foreignIdFor(\App\Models\User::class, 'user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
       

        Schema::dropIfExists('documents');
    }

 
};
