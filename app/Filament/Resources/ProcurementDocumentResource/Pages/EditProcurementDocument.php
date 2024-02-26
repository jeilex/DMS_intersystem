<?php

namespace App\Filament\Resources\ProcurementDocumentResource\Pages;

use App\Filament\Resources\ProcurementDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditProcurementDocument extends EditRecord
{
    protected static string $resource = ProcurementDocumentResource::class;

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
