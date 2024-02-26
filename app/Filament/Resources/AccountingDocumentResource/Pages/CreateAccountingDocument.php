<?php

namespace App\Filament\Resources\AccountingDocumentResource\Pages;

use App\Filament\Resources\AccountingDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAccountingDocument extends CreateRecord
{
    protected static string $resource = AccountingDocumentResource::class;
    
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
