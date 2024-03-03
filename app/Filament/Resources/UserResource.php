<?php

namespace App\Filament\Resources;

use Filament\Forms;
use App\Models\User;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Resources\Pages\Page;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\UserResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\UserResource\RelationManagers;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
    protected static ?int $navigationSort = 15;
    protected static ?string $navigationIcon = 'heroicon-s-users';
    protected static ?string $navigationGroup = 'Accounts';

    public static function form(Form $form): Form
{
    return $form->schema([
        
        Forms\Components\Card::make()->schema([
            Forms\Components\Grid::make(columns: 2)->schema([
                Forms\Components\TextInput::make('name')->unique(ignoreRecord: true)->required()->maxLength(255),
                Forms\Components\TextInput::make('email')->unique(ignoreRecord: true)->email()->required()->maxLength(255),
                // Forms\Components\DateTimePicker::make('email_verified_at'),
                Forms\Components\DateTimePicker::make('created_at')
                ->default(Date::now()->timezone('Asia/Manila')->format('Y-m-d H:i:s'))
                ->disabled(),
                Forms\Components\DateTimePicker::make('updated_at')
                ->default(Date::now()->timezone('Asia/Manila')->format('Y-m-d H:i:s'))
                ->disabled(),
                Forms\Components\TextInput::make('password')
                ->password()
                ->unique()
                ->dehydrateStateUsing(fn ($state) => Hash::make($state))
                ->dehydrated(fn ($state) => filled($state))
                ->required(fn (Page $livewire) => $livewire instanceof CreateUser)
                ->maxLength(255),

                // Select::make('Roles')
                //   ->relationship('roles', 'name')->preload(),
                // Select::make('Permissions')
                //   ->multiple()
                //   ->relationship('permissions', 'name')->preload()
                // Forms\Components\Select::make('role_id')
                // ->relationship('role', 'name')
                
                        Select::make('department')
                        ->options([
                            'engineering' => 'Engineering',
                            'procurement' => 'Procurement',
                            'purchasing' => 'Purchasing',
                            'logistics' => 'Logistics',
                            'accounting' => 'Accounting',
                            'sales' => 'Sales',
                        ])->required(),
                    Select::make('role')
                        ->required()
                        ->relationship('roles', 'name')->preload(),

                    //  Select::make('roles')
                    //     ->options(User::ROLES)
                    //     ->required(),
                    Select::make('permission')
                        ->multiple()
                        ->relationship('permissions', 'name')->preload(),
                    ]),
        ]),
    ]);
}


    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->sortable(),
                // Tables\Columns\TextColumn::make('email_verified_at')
                //     ->dateTime()
                //     ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable(),
                    // ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable(),
                    // ->toggleable(isToggledHiddenByDefault: true),
                // Tables\Columns\SelectColumn::make('roles')
                //     ->searchable()
                //     ->sortable(),
                Tables\Columns\SelectColumn::make('department')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                    // Tables\Columns\SelectColumn::make('permission')
                    // ->searchable()
                    // ->sortable(),
                    Tables\Columns\SelectColumn::make('role')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\SelectColumn::make('permission')
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
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            
        ];
    }

   

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
    
}
