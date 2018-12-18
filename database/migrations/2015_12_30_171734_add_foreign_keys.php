<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddForeignKeys extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users_admin', function (Blueprint $table) {
            $table->foreign('country_id')
                ->references('id')
                ->on('countries_admin')
                ->onDelete('set null');

            $table->foreign('role_id')
                ->references('id')
                ->on('roles_admin');
        });

        Schema::table('social_logins', function (Blueprint $table) {
            $table->foreign('user_id')
                ->references('id')
                ->on('users_admin')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users_admin', function (Blueprint $table) {
            $table->dropForeign('users_admin_country_id_foreign');
            $table->dropForeign('users_admin_role_id_foreign');
        });

        Schema::table('social_logins', function (Blueprint $table) {
            $table->dropForeign('social_logins_user_id_foreign');
        });
    }
}