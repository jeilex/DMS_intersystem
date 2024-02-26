<?php

namespace App\Filament\Resources\AccountingSendDocumentsResource\Pages;

use App\Filament\Resources\AccountingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAccountingSendDocuments extends EditRecord
{
    protected static string $resource = AccountingSendDocumentsResource::class;

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
