<?php

namespace App\Filament\Resources\SendDocumentsResource\Pages;

use App\Filament\Resources\SendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageSendDocuments extends ManageRecords
{
    protected static string $resource = SendDocumentsResource::class;

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
