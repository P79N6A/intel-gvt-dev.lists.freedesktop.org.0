Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp374167ywa;
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbKF7KwaESp2cbENnDic6uipPLTDkvNgQDkUEDU5ldmbSDksctdckAk1/AlX+FT0ML3VdO0
X-Received: by 2002:a63:d444:: with SMTP id i4mr8192502pgj.237.1550220670219;
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550220670; cv=none;
        d=google.com; s=arc-20160816;
        b=qLiYuZDW5bvaWz4fTG7mPkqJEf6AEjreS7aAkQq+9z7CAF2HcQkGj4SncSl1Dwzd4V
         sumOvavLQg1QG9Ea0kba/444I5EvVOjyMzQo7kjb4MAppSTfDxzUCUUb3xRhjygbzmsJ
         SRTFRCq6blo3br3uRwmVkob7qTypF6mnkUEzcxwm0vZuzEdMNcM2tbQaJ7733xZbcZiR
         FD4RESBnl03p8L8UCgobXVihA5RjqyXpDscwve4Cx/1avV8u1dC4gKKQNaGILXuD8WYH
         WpABZDGZOLVNTP9jRRmSBm5A8E/fnLaf6u6rXTq3b/o6SFjfJQPIZdRokcp0U3wZWVcx
         guLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=WiDsDFznZh0Jwfr1t2fbtcGU3Ba0Q6gTLOuNOj3j+kI=;
        b=FVW0ei9urjdP2Nvzx9ijHe2gl9IiKrtAD7+cKTWH5YPgrM/cu3ChIVqkHoYetapwUQ
         3YTrIjqZTKp2WUqv1sbELcykC19a3ITDmaGN5q2s5eRn3lZLr3JIXNVNkSD5hasNEM4z
         3prQ0Jn44U+xfCO1eQDjAOZKiqTMzsDz89Ki4XNb4sByKH93pJm5XNdh4sTtwv3cbs2Y
         IdgAFtsgxlsUlicvmNbtAGLK1BXFfdnq0wiUAuzmB2iYuFvVmcthYa9uOw0FnnnJx1tf
         Nrda4/ah/X7ypv3Vlv7M+PvMiAoqG3Y3yXZU+RAVpt2nM9hi2hpRjvUKKUznOJ9C0s/c
         GmRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n17si2996183pgv.485.2019.02.15.00.51.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027896EAD9;
	Fri, 15 Feb 2019 08:49:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5536E058
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Feb 2019 01:57:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 17:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,371,1544515200"; d="scan'208";a="138772577"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga001.jf.intel.com with ESMTP; 14 Feb 2019 17:57:35 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 14 Feb 2019 17:57:35 -0800
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 14 Feb 2019 17:57:34 -0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.194]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.174]) with mapi id 14.03.0415.000;
 Fri, 15 Feb 2019 09:57:32 +0800
From: "He, Min" <min.he@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] hv: pass-thru PMU registers when no PROFILING_ON
Thread-Topic: [PATCH 1/2] hv: pass-thru PMU registers when no PROFILING_ON
Thread-Index: AQHUxNGoxjbQCK69cUakdu/BcvKv2qXgGd7w
Date: Fri, 15 Feb 2019 01:57:32 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519AD0DC@SHSMSX103.ccr.corp.intel.com>
References: <20190215014204.6650-1-min.he@intel.com>
In-Reply-To: <20190215014204.6650-1-min.he@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2IzMTJjN2MtYzIzNi00NjA5LWE1YzItNGYzZTNlYzljZmRhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYnlnMjJUTWtFdGZWUzJnMjgrdGprTUdNOTlNQlwvS3dadlNoUXZhU0c1MGdETEpOOENHbEtPTXZ2NGhyZ28yeWsifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2VuZGluZyB0byBhIHdyb25nIG1haWwgbGlzdC4gUGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLgoK
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEhlLCBNaW4KPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDE1LCAyMDE5IDk6NDIgQU0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogSGUsIE1pbiA8bWluLmhlQGludGVsLmNvbT4KPiBTdWJqZWN0
OiBbUEFUQ0ggMS8yXSBodjogcGFzcy10aHJ1IFBNVSByZWdpc3RlcnMgd2hlbiBubyBQUk9GSUxJ
TkdfT04KPiAKPiBJbiBkZWJ1ZyB2ZXJzaW9uLCB3aGVuIGRpc2FibGluZyBQUk9GSUxJTkcsIHdl
IHdpbGwgcGFzcy10aHJ1IHRoZQo+IFBNVSByZWdpc3RlcnMgdG8gYWxsb3cgcGVyZiB0b29sIHRv
IGJlIHJ1biBpbiBVT1MgZGlyZWN0bHkuCj4gQWxzbywgYSBQTUkgaW50ZXJydXB0IGhhbmRsZXIg
aXMgcmVnaXN0ZXJlZCB0byBzZW5kIHRoZSBQTUkgaW50ZXJydXB0cwo+IHRvIHRoZSBVT1MgdGhy
b3VnaCBWTEFQSUMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWluIEhlIDxtaW4uaGVAaW50ZWwuY29t
Pgo+IC0tLQo+ICBoeXBlcnZpc29yL2FyY2gveDg2L2d1ZXN0L3ZjcHVpZC5jIHwgIDIgKysKPiAg
aHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92bXNyLmMgICB8ICAyICsrCj4gIGh5cGVydmlzb3Iv
ZGVidWcvaHlwZXJjYWxsLmMgICAgICAgfCAgOCArKysrKysrCj4gIGh5cGVydmlzb3IvZGVidWcv
cHJvZmlsaW5nLmMgICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
NCBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2h5cGVy
dmlzb3IvYXJjaC94ODYvZ3Vlc3QvdmNwdWlkLmMKPiBiL2h5cGVydmlzb3IvYXJjaC94ODYvZ3Vl
c3QvdmNwdWlkLmMKPiBpbmRleCBkYjM4MjQyYi4uZTIwZDJmMzUgMTAwNjQ0Cj4gLS0tIGEvaHlw
ZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92Y3B1aWQuYwo+ICsrKyBiL2h5cGVydmlzb3IvYXJjaC94
ODYvZ3Vlc3QvdmNwdWlkLmMKPiBAQCAtMjMwLDggKzIzMCwxMCBAQCBpbnQzMl90IHNldF92Y3B1
aWRfZW50cmllcyhzdHJ1Y3QgYWNybl92bSAqdm0pCj4gIAkJCQlicmVhazsKPiAKPiAgCQkJLyog
VGhlc2UgZmVhdHVyZXMgYXJlIGRpc2FibGVkICovCj4gKyNpZmRlZiBQUk9GSUxJTkdfT04KPiAg
CQkJLyogUE1VIGlzIG5vdCBzdXBwb3J0ZWQgKi8KPiAgCQkJY2FzZSAweDBhVToKPiArI2VuZGlm
IC8qIFBST0ZJTElOR19PTiAqLwo+ICAJCQkvKiBJbnRlbCBSRFQgKi8KPiAgCQkJY2FzZSAweDBm
VToKPiAgCQkJY2FzZSAweDEwVToKPiBkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci9hcmNoL3g4Ni9n
dWVzdC92bXNyLmMKPiBiL2h5cGVydmlzb3IvYXJjaC94ODYvZ3Vlc3Qvdm1zci5jCj4gaW5kZXgg
ODczYzM2YmMuLmJkYzYyOWJjIDEwMDY0NAo+IC0tLSBhL2h5cGVydmlzb3IvYXJjaC94ODYvZ3Vl
c3Qvdm1zci5jCj4gKysrIGIvaHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92bXNyLmMKPiBAQCAt
MTE0LDYgKzExNCw3IEBAIHN0YXRpYyBjb25zdCB1aW50MzJfdAo+IHVuc3VwcG9ydGVkX21zcnNb
TlVNX1VOU1VQUE9SVEVEX01TUlNdID0gewo+ICAJTVNSX1NHWE9XTkVSRVBPQ0gwLAo+ICAJTVNS
X1NHWE9XTkVSRVBPQ0gxLAo+IAo+ICsjaWZkZWYgUFJPRklMSU5HX09OCj4gIAkvKiBQZXJmb3Jt
YW5jZSBDb3VudGVycyBhbmQgRXZlbnRzOiBDUFVJRC4wQUguRUFYWzE1OjhdICovCj4gIAlNU1Jf
SUEzMl9QTUMwLAo+ICAJTVNSX0lBMzJfUE1DMSwKPiBAQCAtMTQ2LDYgKzE0Nyw3IEBAIHN0YXRp
YyBjb25zdCB1aW50MzJfdAo+IHVuc3VwcG9ydGVkX21zcnNbTlVNX1VOU1VQUE9SVEVEX01TUlNd
ID0gewo+ICAJTVNSX0lBMzJfRklYRURfQ1RSMCwKPiAgCU1TUl9JQTMyX0ZJWEVEX0NUUjEsCj4g
IAlNU1JfSUEzMl9GSVhFRF9DVFIyLAo+ICsjZW5kaWYgLyogUFJPRklMSU5HX09OICovCj4gCj4g
IAkvKiBRT1MgQ29uZmlndXJhdGlvbiBkaXNhYmxlZDogQ1BVSUQuMTBILkVDWFsyXSAqLwo+ICAJ
TVNSX0lBMzJfTDNfUU9TX0NGRywKPiBkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci9kZWJ1Zy9oeXBl
cmNhbGwuYyBiL2h5cGVydmlzb3IvZGVidWcvaHlwZXJjYWxsLmMKPiBpbmRleCBmMjBmNDNkMy4u
MzJlOTBjZTIgMTAwNjQ0Cj4gLS0tIGEvaHlwZXJ2aXNvci9kZWJ1Zy9oeXBlcmNhbGwuYwo+ICsr
KyBiL2h5cGVydmlzb3IvZGVidWcvaHlwZXJjYWxsLmMKPiBAQCAtNjEsNiArNjEsMTQgQEAgc3Rh
dGljIGludDMyX3QgaGNhbGxfcHJvZmlsaW5nX29wcyhzdHJ1Y3QgYWNybl92bSAqdm0sCj4gdWlu
dDY0X3QgY21kLCB1aW50NjRfdCBwYQo+ICAJfQo+ICAgCXJldHVybiByZXQ7Cj4gIH0KPiArCj4g
KyNlbHNlCj4gKwo+ICtzdGF0aWMgaW50MzJfdCBoY2FsbF9wcm9maWxpbmdfb3BzKF9fdW51c2Vk
IHN0cnVjdCBhY3JuX3ZtICp2bSwgX191bnVzZWQKPiB1aW50NjRfdCBjbWQsIF9fdW51c2VkIHVp
bnQ2NF90IHBhcmFtKQo+ICt7Cj4gKwlyZXR1cm4gLUVQRVJNOwo+ICt9Cj4gKwo+ICAjZW5kaWYg
LyogUFJPRklMSU5HX09OICovCj4gCj4gIC8qKgo+IGRpZmYgLS1naXQgYS9oeXBlcnZpc29yL2Rl
YnVnL3Byb2ZpbGluZy5jIGIvaHlwZXJ2aXNvci9kZWJ1Zy9wcm9maWxpbmcuYwo+IGluZGV4IDQx
YWZmZjYwLi4zZjI2MTk2NiAxMDA2NDQKPiAtLS0gYS9oeXBlcnZpc29yL2RlYnVnL3Byb2ZpbGlu
Zy5jCj4gKysrIGIvaHlwZXJ2aXNvci9kZWJ1Zy9wcm9maWxpbmcuYwo+IEBAIC0xNDU1LDQgKzE0
NTUsMzkgQEAgdm9pZCBwcm9maWxpbmdfc2V0dXAodm9pZCkKPiAgCWRldl9kYmcoQUNSTl9EQkdf
UFJPRklMSU5HLCAiJXM6IGV4aXRpbmciLCBfX2Z1bmNfXyk7Cj4gIH0KPiAKPiArI2Vsc2UKPiAr
Cj4gKyNpbmNsdWRlIDxoeXBlcnZpc29yLmg+Cj4gKwo+ICt2b2lkIHByb2ZpbGluZ192bWVudGVy
X2hhbmRsZXIoX191bnVzZWQgc3RydWN0IGFjcm5fdmNwdSAqdmNwdSkge30KPiArdm9pZCBwcm9m
aWxpbmdfcHJlX3ZtZXhpdF9oYW5kbGVyKF9fdW51c2VkIHN0cnVjdCBhY3JuX3ZjcHUgKnZjcHUp
IHt9Cj4gK3ZvaWQgcHJvZmlsaW5nX3Bvc3Rfdm1leGl0X2hhbmRsZXIoX191bnVzZWQgc3RydWN0
IGFjcm5fdmNwdSAqdmNwdSkge30KPiArCj4gK3N0YXRpYyB2b2lkIHBtdV9wYXNzdGhydV9wbWlf
aGFuZGxlcihfX3VudXNlZCB1aW50MzJfdCBpcnEsIF9fdW51c2VkCj4gdm9pZCAqZGF0YSkKPiAr
ewo+ICsJc3RydWN0IGFjcm5fdmNwdSAqdmNwdSA9IGdldF9ldmVyX3J1bl92Y3B1KGdldF9jcHVf
aWQoKSk7Cj4gKwo+ICsJbXNyX3dyaXRlKE1TUl9JQTMyX0VYVF9BUElDX0xWVF9QTUksCj4gVkVD
VE9SX1BNSXxMQVBJQ19MVlRfTUFTSyk7Cj4gKwl2bGFwaWNfc2V0X2xvY2FsX2ludHIodmNwdS0+
dm0sIHZjcHUtPnZjcHVfaWQsIEFQSUNfTFZUX1BNQyk7Cj4gKwltc3Jfd3JpdGUoTVNSX0lBMzJf
RVhUX0FQSUNfTFZUX1BNSSwgVkVDVE9SX1BNSSk7Cj4gK30KPiArCj4gK3ZvaWQgcHJvZmlsaW5n
X3NldHVwKHZvaWQpCj4gK3sKPiArCXVpbnQxNl90IGNwdTsKPiArCWludDMyX3QgcmV0dmFsOwo+
ICsKPiArCWNwdSA9IGdldF9jcHVfaWQoKTsKPiArCWlmIChjcHUgPT0gQk9PVF9DUFVfSUQpewo+
ICsJCXJldHZhbCA9IHJlcXVlc3RfaXJxKFBNSV9JUlEsCj4gKwkJCQlwbXVfcGFzc3RocnVfcG1p
X2hhbmRsZXIsIE5VTEwsCj4gSVJRRl9OT05FKTsKPiArCQlpZiAocmV0dmFsIDwgMCkgewo+ICsJ
CQlwcl9lcnIoIkZhaWxlZCB0byBhZGQgUE1JIGlzciIpOwo+ICsJCQlyZXR1cm47Cj4gKwkJfQo+
ICsJfQo+ICsKPiArCW1zcl93cml0ZShNU1JfSUEzMl9FWFRfQVBJQ19MVlRfUE1JLCBWRUNUT1Jf
UE1JKTsKPiArfQo+ICsKPiAgI2VuZGlmCj4gLS0KPiAyLjE3LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
