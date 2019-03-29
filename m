Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1908814ywb;
        Fri, 29 Mar 2019 07:24:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEgk8duG1SMYJZeKAB00erR6k96c1hNe7EbG4Ru4ivhfucXEx7ay8qv60Xrb36lY6qafaY
X-Received: by 2002:aa7:8c84:: with SMTP id p4mr8918058pfd.164.1553869479391;
        Fri, 29 Mar 2019 07:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553869479; cv=none;
        d=google.com; s=arc-20160816;
        b=o+tqu/oQCXvcu/d3eaf7gEmAp2jb4I4Gh+pKsu1Y+PWnZww9L7F47ufNSDWs+Fbrlw
         FkSkooDKPhf9QF9qhEThsikfi4J0e3wukHYXUUXQvruPb3sxUkKo4ICq635iJr16tq1I
         dMzoN6/mQmntM7xNEBowJ+sb9RJD8IQWavLO4U0hVaaHYXJyzG9q7iSUISVPyPR0yrS4
         cob/fsGuxL2rftbw39OSOQpjajFqI+JW4nuggi6709C4xEbPo8myP7AT9gUqIuUXXlKl
         ctn8y8KSgVISNgZd7DPm+ovXjrVWAwzCowhMPXesITJRbkhb6mNqQEeQCU8oBFlJWtbT
         f/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=YOR2FmRbwPi9JTqm1Z3yVnRhMxws0vXhKYyYa3wHPqA=;
        b=FoZcqBIMEsZNRIIZ+3dAuLzFe22J9DsS2HmxgQA+vqyStvQS7sWQ2HJ/s5RQPRISn9
         1AdIY50UiHGuq6SWPHSd94PtLancY5OdMsbEt0/KoMsRH/rH9kix4OycwEcBQ72dH2UV
         Qvd6XYzdjPqPe1vKVw6l5hShBZlNG+rl3t4/FrPqbN3F7srB4mm7V+Og+FN5FIqH8FqX
         XQEGyWY6bGA4T3symKIYYNRwA6/hQhmPHLbf18UIBcKxVZJ3oPhXcvAN0Bz/e0P2bnHn
         nTZ+DXu9FGv/kNSjudOsCxYld9eG9SiGs3G52UPxpNhJYcShPk11ctdjiTFyGOGZVv56
         nupw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g21si1972891pfg.286.2019.03.29.07.24.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 07:24:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DDB6E85A;
	Fri, 29 Mar 2019 14:24:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B1DF6E825;
 Fri, 29 Mar 2019 14:24:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31C75A78;
 Fri, 29 Mar 2019 07:24:38 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D18143F557;
 Fri, 29 Mar 2019 07:24:37 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 326E06822CD; Fri, 29 Mar 2019 14:24:36 +0000 (GMT)
Date: Fri, 29 Mar 2019 14:24:36 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] drm: prefix header search paths with $(srctree)/
Message-ID: <20190329142436.GQ21747@e110455-lin.cambridge.arm.com>
References: <1553859161-2628-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553859161-2628-1-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Zhi Wang <zhi.a.wang@intel.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Brian Starkey <brian.starkey@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjksIDIwMTkgYXQgMDg6MzI6NDFQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IEN1cnJlbnRseSwgdGhlIEtidWlsZCBjb3JlIG1hbmlwdWxhdGVzIGhlYWRlciBz
ZWFyY2ggcGF0aHMgaW4gYSBjcmF6eQo+IHdheSBbMV0uCj4gCj4gVG8gZml4IHRoaXMgbWVzcywg
SSB3YW50IGFsbCBNYWtlZmlsZXMgdG8gYWRkIGV4cGxpY2l0ICQoc3JjdHJlZSkvIHRvCj4gdGhl
IHNlYXJjaCBwYXRocyBpbiB0aGUgc3JjdHJlZS4gU29tZSBNYWtlZmlsZXMgYXJlIGFscmVhZHkg
d3JpdHRlbiBpbgo+IHRoYXQgd2F5LCBidXQgbm90IGFsbC4gVGhlIGdvYWwgb2YgdGhpcyB3b3Jr
IGlzIHRvIG1ha2UgdGhlIG5vdGF0aW9uCj4gY29uc2lzdGVudCwgYW5kIGZpbmFsbHkgZ2V0IHJp
ZCBvZiB0aGUgZ3Jvc3MgaGFja3MuCj4gCj4gSGF2aW5nIHdoaXRlc3BhY2VzIGFmdGVyIC1JIGRv
ZXMgbm90IG1hdHRlciBzaW5jZSBjb21taXQgNDhmNmUzY2Y1YmM2Cj4gKCJrYnVpbGQ6IGRvIG5v
dCBkcm9wIC1JIHdpdGhvdXQgcGFyYW1ldGVyIikuCj4gCj4gWzFdOiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzk2MzIzNDcvCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8g
WWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiBSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IC0tLQo+IAo+IEkgcHV0IGFsbCBncHUvZHJt
IGNoYW5nZXMgaW50byBhIHNpbmdsZSBwYXRjaCBiZWNhdXNlCj4gdGhleSBhcmUgdHJpdmlhbCBj
b252ZXJzaW9uLgo+IAo+IElmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgYmlnIHBpY3R1cmUg
b2YgdGhpcyB3b3JrLAo+IHRoZSBmdWxsIHBhdGNoIHNldCBpcyBhdmFpbGFibGUgYXQgdGhlIGZv
bGxvd2luZyBVUkwuCj4gCj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L21hc2FoaXJveS9saW51eC1rYnVpbGQuZ2l0IGJ1aWxkLXRlc3QKPiAKPiAKPiBDaGFu
Z2VzIGluIHYyOgo+ICAgLSBmaXggdXAgdGhlIG5ldyBkcml2ZXIga29tZWRhCj4gICAtIEFkZCBT
YW0ncyBSZXZpZXdlZC1ieQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmls
ZSAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2xpYi9NYWtlZmlsZSAgICAg
ICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2Vm
aWxlIHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9NYWtlZmlsZSAgICAgICAg
ICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vTWFrZWZpbGUgICAgICAgICAgICAgICAg
fCA2ICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQgICAgICAgICAgICAg
IHwgOCArKysrLS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9N
YWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gaW5kZXggNDY2
ZGE1OS4uNjJiZjlkYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9N
YWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gQEAg
LTIzLDcgKzIzLDcgQEAKPiAgIyBNYWtlZmlsZSBmb3IgdGhlIGRybSBkZXZpY2UgZHJpdmVyLiAg
VGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3IgdGhlCj4gICMgRGlyZWN0IFJlbmRlcmlu
ZyBJbmZyYXN0cnVjdHVyZSAoRFJJKSBpbiBYRnJlZTg2IDQuMS4wIGFuZCBoaWdoZXIuCj4gIAo+
IC1GVUxMX0FNRF9QQVRIPSQoc3JjKS8uLgo+ICtGVUxMX0FNRF9QQVRIPSQoc3JjdHJlZSkvJChz
cmMpLy4uCj4gIERJU1BMQVlfRk9MREVSX05BTUU9ZGlzcGxheQo+ICBGVUxMX0FNRF9ESVNQTEFZ
X1BBVEggPSAkKEZVTExfQU1EX1BBVEgpLyQoRElTUExBWV9GT0xERVJfTkFNRSkKPiAgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvbGliL01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9saWIvTWFrZWZpbGUKPiBpbmRleCA2OTAyNDMwLi5kNTM0OTkyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvbGliL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9saWIvTWFrZWZpbGUKPiBAQCAtMjcsNiArMjcsNiBAQAo+ICAjIGRyaXZlciBjb21w
b25lbnRzIG9yIGxhdGVyIG1vdmVkIHRvIGtlcm5lbC9saWIgZm9yIHNoYXJpbmcgd2l0aAo+ICAj
IG90aGVyIGRyaXZlcnMuCj4gIAo+IC1jY2ZsYWdzLXkgOj0gLUkkKHNyYykvLi4vaW5jbHVkZQo+
ICtjY2ZsYWdzLXkgOj0gLUkgJChzcmN0cmVlKS8kKHNyYykvLi4vaW5jbHVkZQo+ICAKPiAgb2Jq
LSQoQ09ORklHX0NIQVNIKSArPSBjaGFzaC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL01ha2VmaWxlCj4gaW5kZXggMWI4NzVlNS4uYTcyZTMwYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+IEBAIC0xLDggKzEsOCBA
QAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gIAo+ICBjY2ZsYWdzLXkg
Oj0gXAo+IC0JLUkkKHNyYykvLi4vaW5jbHVkZSBcCj4gLQktSSQoc3JjKQo+ICsJLUkgJChzcmN0
cmVlKS8kKHNyYykvLi4vaW5jbHVkZSBcCj4gKwktSSAkKHNyY3RyZWUpLyQoc3JjKQo+ICAKPiAg
a29tZWRhLXkgOj0gXAo+ICAJa29tZWRhX2Rydi5vIFwKCkZvciBrb21lZGE6CgpBY2tlZC1ieTog
TGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpJJ20gYXNzdW1pbmcgdGhlIHNlcmll
cyBpbiBnb2luZyB0byBiZSBtZXJnZWQgaW50byBvbmUgZ28sIHNvIEkgZG9uJ3QKaGF2ZSB0byB0
YWtlIHRoZSBpbmRpdmlkdWFsIHBhdGNoIGluIG15IHRyZWUsIGJ1dCBpZiBJJ20gd3JvbmcgcGxl
YXNlCmxldCBtZSBrbm93LgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L01ha2VmaWxlCj4gaW5kZXggMjcxZmI0Ni4uZWE4MzI0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvTWFrZWZpbGUKPiBAQCAtNSw1ICs1LDUgQEAgR1ZUX1NPVVJDRSA6PSBndnQubyBhcGVydHVy
ZV9nbS5vIGhhbmRsZXJzLm8gdmdwdS5vIHRyYWNlX3BvaW50cy5vIGZpcm13YXJlLm8gXAo+ICAJ
ZXhlY2xpc3QubyBzY2hlZHVsZXIubyBzY2hlZF9wb2xpY3kubyBtbWlvX2NvbnRleHQubyBjbWRf
cGFyc2VyLm8gZGVidWdmcy5vIFwKPiAgCWZiX2RlY29kZXIubyBkbWFidWYubyBwYWdlX3RyYWNr
Lm8KPiAgCj4gLWNjZmxhZ3MteQkJCQkrPSAtSSQoc3JjKSAtSSQoc3JjKS8kKEdWVF9ESVIpCj4g
K2NjZmxhZ3MteQkJCQkrPSAtSSAkKHNyY3RyZWUpLyQoc3JjKSAtSSAkKHNyY3RyZWUpLyQoc3Jj
KS8kKEdWVF9ESVIpLwo+ICBpOTE1LXkJCQkJCSs9ICQoYWRkcHJlZml4ICQoR1ZUX0RJUikvLCAk
KEdWVF9TT1VSQ0UpKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL01ha2VmaWxl
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZQo+IGluZGV4IDU2YTcwYzcuLmI3YjFlYmQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vTWFrZWZpbGUKPiBAQCAtMSw3ICsxLDcgQEAKPiAgIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAo+IC1jY2ZsYWdzLXkgOj0gLUlkcml2ZXJzL2dwdS9kcm0v
bXNtCj4gLWNjZmxhZ3MteSArPSAtSWRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxCj4gLWNj
ZmxhZ3MtJChDT05GSUdfRFJNX01TTV9EU0kpICs9IC1JZHJpdmVycy9ncHUvZHJtL21zbS9kc2kK
PiArY2NmbGFncy15IDo9IC1JICQoc3JjdHJlZSkvJChzcmMpCj4gK2NjZmxhZ3MteSArPSAtSSAk
KHNyY3RyZWUpLyQoc3JjKS9kaXNwL2RwdTEKPiArY2NmbGFncy0kKENPTkZJR19EUk1fTVNNX0RT
SSkgKz0gLUkgJChzcmN0cmVlKS8kKHNyYykvZHNpCj4gIAo+ICBtc20teSA6PSBcCj4gIAlhZHJl
bm8vYWRyZW5vX2RldmljZS5vIFwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvS2J1aWxkIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkCj4gaW5kZXggZWEzMDM1
ZS4uNGZhZTcyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQKPiBAQCAtMSw3ICsxLDcgQEAK
PiAtY2NmbGFncy15ICs9IC1JJChzcmMpL2luY2x1ZGUKPiAtY2NmbGFncy15ICs9IC1JJChzcmMp
L2luY2x1ZGUvbnZrbQo+IC1jY2ZsYWdzLXkgKz0gLUkkKHNyYykvbnZrbQo+IC1jY2ZsYWdzLXkg
Kz0gLUkkKHNyYykKPiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpL2luY2x1ZGUK
PiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpL2luY2x1ZGUvbnZrbQo+ICtjY2Zs
YWdzLXkgKz0gLUkgJChzcmN0cmVlKS8kKHNyYykvbnZrbQo+ICtjY2ZsYWdzLXkgKz0gLUkgJChz
cmN0cmVlKS8kKHNyYykKPiAgCj4gICMgTlZLTSAtIEhXIHJlc291cmNlIG1hbmFnZXIKPiAgIy0g
Y29kZSBhbHNvIHVzZWQgYnkgdmFyaW91cyB1c2Vyc3BhY2UgdG9vbHMvdGVzdHMKPiAtLSAKPiAy
LjcuNAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBm
aXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwK
IFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
