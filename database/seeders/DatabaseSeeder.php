<?php

namespace Database\Seeders;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use Spatie\Permission\Models\Role;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        

        $permissions = [

            'View Role',
            'Create Role',
            'Update Role',
            'Delete Role',
            'CRUD Role',
    
            'View Accounting Documents',
           ' Create Accounting Documents',
            'Update Accounting Documents',
           ' Delete Accounting Documents',
           ' CRUD Accounting Documents',
    
           ' View Accounting Send Documents',
            'Create Accounting Send Documents',
           ' Update Accounting Send Documents',
           ' Delete Accounting Send Documents',
           ' CRUD Accounting Send Documents',
    
            'View Sales Document',
            'Create Sales Document',
            'Update Sales Document',
            'Delete Sales Document',
           ' CRUD Sales Document',
    
            'View Sales Send Document',
            'Create Sales Send Document',
           ' Delete Sales Send Document',
            'Update Sales Send Document',
           ' CRUD Sales Send Document',
    
            'View Admin Documents',
            'Create Admin Documents',
            'Delete Admin Documents',
            'Update Admin Documents',
            'CRUD Admin Documents',
    
            'View Engineering Documents',
          '  Create Engineering Documents',
           ' Update Engineering Documents',
           ' Delete Engineering Documents',
          '  CRUD Engineering Documents',
    
           ' View Engineering Send Documents',
           ' Create Engineering Send Documents',
           ' Update Engineering Send Documents',
           ' Delete Engineering Send Documents',
           ' CRUD Engineering Send Documents',
    
           ' View Logistics Documents',
           ' Create Logistics Documents',
           ' Update Logistics Documents',
           ' Delete Logistics Documents',
           ' CRUD Logistics Documents',
    
           ' View Logistics Send Documents',
           ' Create Logistics Send Documents',
           ' Update Logistics Send Documents',
            'Delete Logistics Send Documents',
            'CRUD Logistics Send Documents',
    
           ' View Procurement Documents',
           ' Create Procurement Documents',
           ' Update Procurement Documents',
           ' Delete Procurement Documents',
           ' CRUD Procurement Documents',
    
           ' View Procurement Send Documents',
           ' Create Procurement Send Documents',
           ' Update Procurement Send Documents',
          ' Delete Procurement Send Documents',
          '  CRUD Procurement Send Documents',
    
          ' View Purchasing Documents',
           ' Create Purchasing Documents',
           ' Update Purchasing Documents',
           ' Delete Purchasing Documents',
           ' CRUD Purchasing Documents',

            'View Admin Send Documents',
          '  Create Admin Send Documents',
           ' Update Admin Send Documents',
           ' Delete Admin Send Documents',
           ' CRUD Admin Send Documents',

           'View Purchasing Send Documents',
           'Create Purchasing Send Documents',
           'Update Purchasing Send Documents',
           'Delete Purchasing Send Documents',
           'CRUD Purchasing Send Documents'
        
           
            ];
    
        
    
            foreach ($permissions as $permission) {
                Permission::firstOrCreate(['name' => trim($permission), 'guard_name' => 'web']);
            }
    }


    
}
