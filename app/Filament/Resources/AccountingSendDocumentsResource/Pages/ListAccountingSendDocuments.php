<?php

namespace App\Filament\Resources\AccountingSendDocumentsResource\Pages;

use App\Filament\Resources\AccountingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAccountingSendDocuments extends ListRecords
{
    protected static string $resource = AccountingSendDocumentsResource::class;

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
