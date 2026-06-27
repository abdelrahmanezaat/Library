using AutoMapper;
using Library.DTOs;
using Library.DTOs.BookDTOs;
using Library.DTOs.CategoryDTOs;
using Library.DTOs.Member;
using Library.Models;

namespace Library.Mappings
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Members
            CreateMap<Member, GetMemberDTO>();
            CreateMap<CreateMemberDTO, Member>();
            CreateMap<UpdateMemberDTO, Member>();

            // Book

            CreateMap<Book, GetBookDTO>()
           
            .ForMember(dest => dest.AuthorIds,
                opt => opt.MapFrom(src => src.BookAuthors.Select(x => x.AuthorId)));

            CreateMap<CreateBookDTO, Book>()
                .ForMember(dest => dest.CoverImageUrl, opt => opt.Ignore())
                .ForMember(dest => dest.BookAuthors, opt => opt.Ignore());

            CreateMap<UpdateBookDTO, Book>()
                .ForMember(dest => dest.CoverImageUrl, opt => opt.Ignore())
                .ForMember(dest => dest.BookAuthors, opt => opt.Ignore());
        }
    }
}