<?php

namespace App\Filament\Resources\AccountingSendDocumentsResource\Pages;

use App\Filament\Resources\AccountingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAccountingSendDocuments extends CreateRecord
{
    protected static string $resource = AccountingSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
