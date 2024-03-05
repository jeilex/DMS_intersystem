<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use App\Models\EngineeringDocument;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\EngineeringDocumentResource\Pages;
use App\Filament\Resources\EngineeringDocumentResource\RelationManagers;

class EngineeringDocumentResource extends Resource
{
    protected static ?string $model = EngineeringDocument::class;
    protected static ?int $navigationSort = 1;
    protected static ?string $navigationLabel = 'Engineering';
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'View Document Status';

    

    public static function getNavigationBadge(): string
    {
        return static::getModel()::count();
    }
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\FileUpload::make('upload_documents')
                ->nullable()
                ->downloadable()
                ->preserveFilenames()
                ->multiple()
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
                 ->nullable(),
                 
                Select::make('status')
                ->label('Status')
                ->options([
                    'approved' => 'Approved',
                    'reject' => 'Reject',
                    'pending' => 'Pending',
                    'revised' => 'Revised',
                ])
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
                public function store(Request $request)
                {
                    $data = $request->validate([
                        // Your validation rules here
                    ]);

                    // Set the user_id field to the authenticated user's ID
                    $data['user_id'] = Auth::id();

                    // Create and save the record
                    User::create($data);

                    // Redirect or return a response
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
                 Tables\Columns\TextColumn::make('status')
                    ->searchable(),
                Tables\Columns\TextColumn::make('message')
                    ->searchable(),
                Tables\Columns\TextColumn::make('remarks')
                    ->searchable(),
                Tables\Columns\TextColumn::make('published_at')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_on')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                    
            ])
            ->filters([
                //
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
            'index' => Pages\ListEngineeringDocuments::route('/'),
            'create' => Pages\CreateEngineeringDocument::route('/create'),
            'edit' => Pages\EditEngineeringDocument::route('/{record}/edit'),
        ];
    }
}
