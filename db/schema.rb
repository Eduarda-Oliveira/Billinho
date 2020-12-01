# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_212151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.date "data_nascimento"
    t.integer "telefone_celular"
    t.string "genero"
    t.string "meio_pagamento_fatura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faturas", force: :cascade do |t|
    t.decimal "valor_fatura_reais"
    t.date "data_vencimento"
    t.string "status"
    t.bigint "matricula_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matricula_id"], name: "index_faturas_on_matricula_id"
  end

  create_table "instituicao_ensinos", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.decimal "valor_total_reais"
    t.integer "quantidade_faturas"
    t.integer "dia_vencimento_faturas"
    t.string "nome_curso"
    t.bigint "aluno_id"
    t.bigint "instituicao_ensino_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["instituicao_ensino_id"], name: "index_matriculas_on_instituicao_ensino_id"
  end

  add_foreign_key "faturas", "matriculas"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "instituicao_ensinos"
end
