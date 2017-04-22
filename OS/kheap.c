#include <inc/memlayout.h>
#include <kern/kheap.h>
#include <kern/memory_manager.h>

//NOTE: All kernel heap allocations are multiples of PAGE_SIZE (4KB)

//=================================================================================//
//============================ REQUIRED FUNCTION ==================================//
//=================================================================================//


struct allocation{
   int size;
   uint32 start;
};
uint32 firstFreeVAInKHeap=0;

struct allocation alloc[41000];
int count=0;

void* kmalloc(unsigned int size)
{
	//TODO: [PROJECT 2017 - [1] Kernel Heap] kmalloc()
	// Write your code here, remove the panic and write your code
	//panic("kmalloc() is not implemented yet...!!")
	//NOTE: Allocation is continuous increasing virtual address
	//NOTE: All kernel heap allocations are multiples of PAGE_SIZE (4KB)
	//refer to the project presentation and documentation for details
	// check if first time call function or not
    if(firstFreeVAInKHeap==0)
    {
    	firstFreeVAInKHeap=(uint32)KERNEL_HEAP_START;
    }
    // calculate size and check if fit in ranges or not , start +size must be less than KERNEL_HEAP_MAX
    size=ROUNDUP(size,PAGE_SIZE);
    uint32 start=firstFreeVAInKHeap;
    uint32 end = firstFreeVAInKHeap+size;
    if(size >=KERNEL_HEAP_MAX-firstFreeVAInKHeap)
    	return NULL;
    // check if there is enough frames or not
    struct Frame_Info *FI_ptr;
    if(free_frame_list.size*PAGE_SIZE < size)
    {
    	return NULL;
    }
    // if there enough frames , then allocate them and and mark in alloc array there is new start and size and inc count
    alloc[count].size=size;
    alloc[count].start=firstFreeVAInKHeap;
    count++;
    while((void*)firstFreeVAInKHeap<(void*)end)
    {
    	int ret=allocate_frame(&FI_ptr);
    	map_frame(ptr_page_directory,FI_ptr,(void*)firstFreeVAInKHeap,PERM_WRITEABLE);
    	FI_ptr->varadd=firstFreeVAInKHeap;
    	firstFreeVAInKHeap+=PAGE_SIZE;
    }
    //TODO: [PROJECT 2017 - BONUS1] Implement a Kernel allocation strategy
	// Instead of the continuous allocation/deallocation, implement both
	// FIRST FIT and NEXT FIT strategies
	// use "isKHeapPlacementStrategyFIRSTFIT() ..." functions to check the current strategy
	//change this "return" according to your answer
     return (void*)start;
}

void kfree(void* virtual_address)
{
	//TODO: [PROJECT 2017 - [1] Kernel Heap] kfree()
	// Write your code here, remove the panic and write your code
	//panic("kfree() is not implemented yet...!!");
	//you need to get the size of the given allocation using its address
	//refer to the project presentation and documentation for details
	// bgeb el index el address dh feh
    int i,siz;
	for(i=0; i<count; i++)
	{
		if(alloc[i].start==(uint32)virtual_address)
		{
			break;
		}
	}
	// delete all pages from start to start+size and unmap  frames
	struct Frame_Info *ptr;
	uint32 * pg_table=NULL, v=alloc[i].start;
    siz=alloc[i].size;
    alloc[i].size=-1;
    alloc[i].start=-1;
	for(int j=0; j<siz;j+=PAGE_SIZE)
	{
		ptr=get_frame_info(ptr_page_directory,(void*)v,&pg_table);
		unmap_frame(ptr_page_directory,(void*)v);
		v+=PAGE_SIZE;
	}

}

unsigned int kheap_virtual_address(unsigned int physical_address)
{
	//TODO: [PROJECT 2017 - [1] Kernel Heap] kheap_virtual_address()
	// Write your code here, remove the panic and write your code
	//panic("kheap_virtual_address() is not implemented yet...!!");
	//return the virtual address corresponding to given physical_address
	//refer to the project presentation and documentation for details
	//change this "return" according to your answer
	struct Frame_Info *Fptr=to_frame_info(physical_address);
	return Fptr->varadd;
}

unsigned int kheap_physical_address(unsigned int virtual_address)
{
	//TODO: [PROJECT 2017 - [1] Kernel Heap] kheap_physical_address()
	// Write your code here, remove the panic and write your code
	//panic("kheap_physical_address() is not implemented yet...!!");
	//return the physical address corresponding to given virtual_address
	//refer to the project presentation and documentation for details
	//change this "return" according to your answer
	uint32 *pg=NULL , PA=0;
	struct Frame_Info *ptr=get_frame_info(ptr_page_directory,(void*)virtual_address,&pg);
	if(ptr!=NULL)
	PA=to_physical_address(ptr);
	return PA;
}


//=================================================================================//
//============================== BONUS FUNCTION ===================================//
//=================================================================================//
// krealloc():

//	Attempts to resize the allocated space at "virtual_address" to "new_size" bytes,
//	possibly moving it in the heap.
//	If successful, returns the new virtual_address, in which case the old virtual_address must no longer be accessed.
//	On failure, returns a null pointer, and the old virtual_address remains valid.

//	A call with virtual_address = null is equivalent to kmalloc().
//	A call with new_size = zero is equivalent to kfree().

void *krealloc(void *virtual_address, uint32 new_size)
{
	//TODO: [PROJECT 2017 - BONUS2] Kernel Heap Realloc
	// Write your code here, remove the panic and write your code
	return NULL;
	panic("krealloc() is not implemented yet...!!");

}
