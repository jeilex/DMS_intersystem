<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Filament\Forms\Components\Select;
use App\Models\EngineeringSendDocuments;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\DateTimePicker;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\EngineeringSendDocumentsResource\Pages;
use App\Filament\Resources\EngineeringSendDocumentsResource\RelationManagers;

class EngineeringSendDocumentsResource extends Resource
{
    protected static ?string $model = EngineeringSendDocuments::class;
    protected static ?int $navigationSort = 1;
    protected static ?string $navigationLabel = 'Engineering';
    protected static ?string $navigationIcon = 'heroicon-s-envelope-open';
    protected static ?string $navigationGroup = 'Department Message';

    public static function getNavigationBadge(): string
    {
        return static::getModel()::count();
    }
    public static function form(Form $form): Form
    {return $form
        ->schema([
            Forms\Components\FileUpload::make('upload_documents')
                ->required()
                ->multiple()
                ->downloadable()
                ->columnSpan(2),
                Select::make('From', 'from')
                ->options(function () {
                    return [
                        Auth::id() => Auth::user()->name,
                    ];
                })
                ->default(Auth::id())
                ->disabled(),
                Forms\Components\TextInput::make('forward')
                ->default('engineering')
                ->readonly(),
                Forms\Components\TextInput::make('message')
                ->required()
                ->maxLength(2048),
                Select::make('status')
                ->label('Status')
                ->options([
                    'approved' => 'Approved',
                    'reject' => 'Reject',
                    'pending' => 'Pending',
                    'revised' => 'Revised',
                ])
                ->default('pending')
                ->disabled(!Auth::user()->isAdmin()),
                Forms\Components\TextInput::make('remarks')
                ->nullable(),
                DateTimePicker::make('published_at')
                ->default(Date::now()->timezone('Asia/Manila')->format('Y-m-d H:i:s'))
                ->disabled(),
                Select::make('User')
                ->options(function () {
                    return \App\Models\User::pluck('user', 'id');
                })
                ->default(Auth::id()) // Set the default value to the authenticated user's ID
                ->relationship('user', 'email')
                ->disabled(),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('upload_documents')
                    ->searchable(),
                Tables\Columns\TextColumn::make('forward')
                    ->searchable(),
                Tables\Columns\TextColumn::make('from')
                    ->searchable(),
                Tables\Columns\TextColumn::make('message'),
                Tables\Columns\TextColumn::make('status')
                ->searchable(),
                Tables\Columns\TextColumn::make('remarks'),
                Tables\Columns\TextColumn::make('published_at')
                ->dateTime()
                ->sortable(),
            Tables\Columns\TextColumn::make('created_at')
                ->dateTime()
                ->sortable(),
            Tables\Columns\TextColumn::make('updated_at')
                ->dateTime()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
        ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEngineeringSendDocuments::route('/'),
            'create' => Pages\CreateEngineeringSendDocuments::route('/create'),
            'edit' => Pages\EditEngineeringSendDocuments::route('/{record}/edit'),
        ];
    }
}
