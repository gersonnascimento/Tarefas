class NotesController < ApplicationController
          http_basic_authenticate_with name: "gerson", password: "gerson"

  def index
		@notes = Note.where("status = 0")
		render 'index'
	end

	def ver_todas
          @notes = Note.order(:status)
          render 'index'
	end

	def finalizeds
          @notes = Note.where("status = 1")
          render 'index'
	end

	def new
		@novo = Note.new
	end

	def create
          @novo = Note.new params.require(:note).permit(:titulo, :texto)
	  @novo.status = 0
          if @novo.save then
            redirect_to root_url
            flash[:notice] = 'Nota criada com sucesso!'
          else
            redirect_to "/produtos/new"
          end
	end

	def show
		@selected = Note.find(params[:id])
	end

	def edit
		@selected = Note.find(params[:id])
	end

	def update
          titulo = params[:note][:titulo]
          texto= params[:note][:texto]
          @selected = Note.find(params[:id])
          @selected.update(titulo: titulo, texto:texto)
          redirect_to note_path(@selected.id)
	end

	def finalize
          @selected = Note.find(params[:id])
          @selected.update(status: 1)
          redirect_to root_path
	end
end
