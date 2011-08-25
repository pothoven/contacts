class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to(@contact, :notice => 'Contact was successfully created.') }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end

  # POST /contacts/1/update
  def update
    @contact = Contact.find(params[:id])
    if params[:contact]
      @contact.update_attributes(params[:contact])
      @contact.save_contact_info
    end
    @contact.reload

    respond_to do |format|
      format.html { redirect_to(@contact, :notice => 'Contact was successfully updated.') }
      format.xml  { render :xml => @contact, :status => :created, :location => @contact }
    end
  end

  # GET /contacts/1/vcard
  def vcard
    @contact = Contact.find(params[:id])
    send_data @contact.vcard.to_s, :filename => "#{@contact.name}.vcf"
  end

  # GET /contacts/vcards
  def vcards
    contacts = Contact.all
    vcards = ""
    contacts.each do |contact|
      vcards += contact.vcard.to_s
    end
    send_data vcards, :filename => "contacts.vcf"
  end

end
