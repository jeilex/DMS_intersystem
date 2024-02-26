<?php

namespace App\Filament\Resources\LogisticsSendDocumentsResource\Pages;

use App\Filament\Resources\LogisticsSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListLogisticsSendDocuments extends ListRecords
{
    protected static string $resource = LogisticsSendDocumentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
