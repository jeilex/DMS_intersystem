<?php

namespace App\Filament\Resources\EngineeringSendDocumentsResource\Pages;

use App\Filament\Resources\EngineeringSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateEngineeringSendDocuments extends CreateRecord
{
    protected static string $resource = EngineeringSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }

    
}
