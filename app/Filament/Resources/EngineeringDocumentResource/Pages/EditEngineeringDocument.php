<?php

namespace App\Filament\Resources\EngineeringDocumentResource\Pages;

use App\Filament\Resources\EngineeringDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditEngineeringDocument extends EditRecord
{
    protected static string $resource = EngineeringDocumentResource::class;

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
