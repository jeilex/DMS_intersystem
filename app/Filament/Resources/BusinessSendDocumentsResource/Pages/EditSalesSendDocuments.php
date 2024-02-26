<?php

namespace App\Filament\Resources\SalesSendDocumentsResource\Pages;

use App\Filament\Resources\SalesSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSalesSendDocuments extends EditRecord
{
    protected static string $resource = SalesSendDocumentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
