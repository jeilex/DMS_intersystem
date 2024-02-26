<?php

namespace App\Filament\Resources\SalesSendDocumentsResource\Pages;

use App\Filament\Resources\SalesSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSalesSendDocuments extends CreateRecord
{
    protected static string $resource = SalesSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
