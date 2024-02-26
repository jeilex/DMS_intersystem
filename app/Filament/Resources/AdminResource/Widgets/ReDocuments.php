<?php

namespace App\Filament\Resources\AdminResource\Widgets;


use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use App\Models\SendDocuments;
use App\Models\SalesSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\AccountingSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\ProcurementSendDocuments;
use Filament\Tables\Table\Columns\TextColumn;
use Filament\Widgets\TableWidget as BaseWidget;

class RevisedDocuments extends BaseWidget
{
    protected int | string | array $columnSpan = 'full';
    protected static ?string $maxHeight = '300px';
    public function table(Table $table): Table
    {
        return $table
            ->query(function (): Builder {
                return SendDocuments::query()
                    ->where('status', 'revised')
                    ->unionAll(EngineeringSendDocuments::where('status', 'revised'))
                    ->unionAll(SalesSendDocuments::where('status', 'revised'))
                    ->unionAll(LogisticsSendDocuments::where('status', 'revised'))
                    ->unionAll(ProcurementSendDocuments::where('status', 'revised'))
                    ->unionAll(PurchasingSendDocuments::where('status', 'revised'))
                    ->unionAll(AccountingSendDocuments::where('status', 'revised'));
            })
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('upload_documents'),
                    // ->searchable(),
                Tables\Columns\TextColumn::make('forward'),
                Tables\Columns\TextColumn::make('from'),
                    // ->searchable(),
                Tables\Columns\TextColumn::make('message'),
                    // ->searchable(),
                Tables\Columns\TextColumn::make('status'),
                    // ->searchable(),
                Tables\Columns\TextColumn::make('remarks'),
                    // ->searchable(),
                Tables\Columns\TextColumn::make('published_at')
                    ->dateTime(),
                    // ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    // ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    // ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                // Tables\Actions\ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    //
                ]),
            ]);
    }
}
