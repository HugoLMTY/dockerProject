
using System.Threading.Tasks;
using Events;
using identity.api.Services;
using MassTransit;

namespace identity.api.Messaging.Consumers
{
    public class ApplicantAppliedEventConsumer : IConsumer<ApplicantAppliedEvent>
    {
        private readonly IIdentityRepository _identityRepository;

        public ApplicantAppliedEventConsumer(IIdentityRepository applicantRepository)
        {
            _identityRepository = applicantRepository;
        }

        public async Task Consume(ConsumeContext<ApplicantAppliedEvent> context)
        {
            // increment the user's application count in the cache
            await _identityRepository.UpdateUserApplicationCountAsync(context.Message.ApplicantId.ToString());
        }
    }
}
