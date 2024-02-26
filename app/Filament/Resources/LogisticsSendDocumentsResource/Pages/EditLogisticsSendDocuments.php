<?php

namespace App\Filament\Resources\LogisticsSendDocumentsResource\Pages;

use App\Filament\Resources\LogisticsSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLogisticsSendDocuments extends EditRecord
{
    protected static string $resource = LogisticsSendDocumentsResource::class;

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
