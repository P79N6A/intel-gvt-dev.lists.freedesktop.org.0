Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2646189ywd;
        Sun, 13 Jan 2019 21:09:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6SKKX+DJizxZhujhKj1WerqruqkFp2BFp6Kcj2UUdGFVsA0lzr9PzWLY4CsaMYLYQvXcg4
X-Received: by 2002:a17:902:ab84:: with SMTP id f4mr23416934plr.207.1547442573770;
        Sun, 13 Jan 2019 21:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547442573; cv=none;
        d=google.com; s=arc-20160816;
        b=bZoN0HN/7tgLpGiEH7p3Q608SnDYPrfvz2+umtUuS080l/ki+ZbjfSr/fAFc3rVBe9
         mp2GanXQZaK6KV0uDz7Q62YWVLpUQj/CrSnlp49XUf5CthnTq67iS89qmVIHsnxGoDKz
         bziwXOLPVLxu0oZf8+GkpxMN9/PtDrAgqSYKVJJfcVS3H1750R01b1sXhmH55DeG0d6g
         Sc7wG/ONTxEnxbyiXbs+go14SqezjdVRCu3kQhGIoITW8sCp7E8scUKy8FfH8FJavzH4
         j3u60s1Y+WW4rEoGFxdKPUhC6qJzgd0y+fjppFPnTHWWZY8aCgmPvcjc6UdKw+vdmCpG
         GmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=wG6uyPTl54cXo17KChcnjMhuDvYyIgThxADTo0/9mRM=;
        b=uksKhfsDmFs/MH1rWaeK7bxXdAtDC6gH34ctsrdsszdqS4hgHYU+UfHHSsHX/LTO5k
         MDR4T5ILr5AZxJOXf21dQYS78soYff+sdy72fZk6bMroPL2Zo9YEG/mbUQEf7AU4FB63
         glVRYk9OnnqovC+YanHrfJ6deglEiK3j8EQEbcghTx8Wmq+WWxDEwmrNnKN3AHGxjU2Y
         eEp/EnMD9aDmtwQVxpi/F777U0IvFtt3j2OkNDS2w0RK9kHFONy5sKkTQnwZqND4G8ea
         nBFxITi6Yh9q1M6vMzeWcbchriKR4l8/u7gh2ZAnDq7cs3HSXHhdaycSiw+dqnZME476
         033w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g8si5419168pgb.128.2019.01.13.21.09.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 21:09:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DC28981D;
	Mon, 14 Jan 2019 05:09:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C618981D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 05:09:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 21:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; d="scan'208";a="106374667"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.81])
 ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2019 21:09:30 -0800
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
Date: Mon, 14 Jan 2019 13:02:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190114035645.GX11631@zhen-hp.sh.intel.com>
Content-Language: en-US
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMS8xNC8xOSAxMTo1NiBBTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4gT24gMjAxOS4wMS4xMCAx
OTowNDo0NSArMDgwMCwgaGFuZy55dWFuQGxpbnV4LmludGVsLmNvbSB3cm90ZToKPj4gRnJvbTog
SGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgo+Pgo+PiBBZGQgb25lIGh5cGVy
Y2FsbCB0byBmcmVlIFZGSU8gcmVnaW9uIG1lbW9yeS4gQWxzbyBjYWxsIGl0IGluIHZncHUKPj4g
ZGVzdHJveS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXgu
aW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxs
LmggfCAgMSArCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgIHwgMTUg
KysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oICAgICAg
IHwgMTQgKysrKysrKysrKysrKysKPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5j
ICAgICAgfCAgMSArCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgKPj4gaW5kZXggNTA3OTg4Ni4uMmFiNDEz
OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaAo+PiBAQCAtNjcsNiAr
NjcsNyBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0X21wdCB7Cj4+ICAgCWludCAoKnNldF90cmFwX2FyZWEp
KHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1NjQgc3RhcnQsIHU2NCBlbmQsCj4+ICAgCQkJICAgICBi
b29sIG1hcCk7Cj4+ICAgCWludCAoKnNldF9vcHJlZ2lvbikodm9pZCAqdmdwdSk7Cj4+ICsJdm9p
ZCAoKmNsZWFuX3JlZ2lvbnMpKHZvaWQgKnZncHUpOwo+PiAgIAlpbnQgKCpnZXRfdmZpb19kZXZp
Y2UpKHZvaWQgKnZncHUpOwo+PiAgIAl2b2lkICgqcHV0X3ZmaW9fZGV2aWNlKSh2b2lkICp2Z3B1
KTsKPj4gICAJYm9vbCAoKmlzX3ZhbGlkX2dmbikodW5zaWduZWQgbG9uZyBoYW5kbGUsIHVuc2ln
bmVkIGxvbmcgZ2ZuKTsKPiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9rdm1ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gaW5kZXggYTE5
ZTY4NC4uOGMzMGRjMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2
bWd0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gQEAgLTQ5
Myw2ICs0OTMsMjAgQEAgc3RhdGljIGludCBrdm1ndF9zZXRfb3ByZWdpb24odm9pZCAqcF92Z3B1
KQo+PiAgIAlyZXR1cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIGt2bWd0X2Ns
ZWFuX3JlZ2lvbnModm9pZCAqcF92Z3B1KQo+PiArewo+PiArCWludCBpOwo+PiArCXN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1ID0gKHN0cnVjdCBpbnRlbF92Z3B1ICopcF92Z3B1Owo+PiArCj4+ICsJ
Zm9yIChpID0gMDsgaSA8IHZncHUtPnZkZXYubnVtX3JlZ2lvbnM7IGkrKykKPj4gKwkJaWYgKHZn
cHUtPnZkZXYucmVnaW9uW2ldLm9wcy0+cmVsZWFzZSkKPj4gKwkJCXZncHUtPnZkZXYucmVnaW9u
W2ldLm9wcy0+cmVsZWFzZSh2Z3B1LAo+PiArCQkJCQkmdmdwdS0+dmRldi5yZWdpb25baV0pOwo+
PiArCXZncHUtPnZkZXYubnVtX3JlZ2lvbnMgPSAwOwo+PiArCWtmcmVlKHZncHUtPnZkZXYucmVn
aW9uKTsKPj4gKwl2Z3B1LT52ZGV2LnJlZ2lvbiA9IE5VTEw7Cj4+ICt9Cj4gCj4gSXQgbG9va3Mg
YSBsaXR0bGUgb3ZlcmtpbGwgdG8gcHV0IHRoaXMgcmVxdWlyZW1udCBvbiBhbGwgaHlwZXJ2aXNv
ciwKPiBhcyBWRklPIHJlZ2lvbiBpcyBLVk1HVCBvbmx5IHRoaW5nLCBlLmcgbWlnaHQgbm90IGJl
IHZhbGlkIGZvciBvdGhlciBoeXBlcnZpc29yLgo+IEFuZCBsb29rcyBvdXIgcmVnaW9uLm9wcy5y
ZWxlYXNlIGlzIG5ldmVyIGFjdHVhbGx5IHVzZWZ1bCwgd2hhdCB3ZSBuZWVkCj4gaXMgdG8gZnJl
ZSB1cCB2Z3B1IHJlZ2lvbnMsIG1heWJlIGp1c3QgYXQgZGV0YWNoIHZncHUgdGltZSB0byBsZXQg
aHlwZXJ2aXNvcgo+IGRvIGFueSBjbGVhbnVwIHJlcXVpcmVkLgo+IApIZW5yeTpTaW5jZSB0aGVy
ZSBpcyBhbHJlYWR5IGh5cGVyY2FsbCAnc2V0X29wcmVnaW9uJywgSSB1c2UgaHlwZXJjYWxsIAph
cyB3ZWxsIHRvIGRvIHJlZ2lvbiBjbGVhbiBmb3Igb3ByZWdpb24gYW5kIGVkaWQgcmVnaW9uIHRv
IGhhdmUgCmNvbnNpc3RlbnQgaW50ZXJmYWNlIGJldHdlZW4gZ3Z0IGFuZCBoeXBlcnZpc29yLiAn
Y2xlYW5fcmVnaW9ucycgd2lsbCAKYWxzbyBiZSBjYWxsZWQgaWYgZmFpbHVyZSBpbiB2Z3B1IGNy
ZWF0ZS4gU28gSSBkaWRuJ3QgaW1wbGVtZW50IGl0IGluIAp2Z3B1IGRldGFjaC4KCj4+ICsKPj4g
ICBzdGF0aWMgdm9pZCBrdm1ndF9wdXRfdmZpb19kZXZpY2Uodm9pZCAqdmdwdSkKPj4gICB7Cj4+
ICAgCWlmIChXQVJOX09OKCEoKHN0cnVjdCBpbnRlbF92Z3B1ICopdmdwdSktPnZkZXYudmZpb19k
ZXZpY2UpKQo+PiBAQCAtMTg3NCw2ICsxODg4LDcgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF9ndnRf
bXB0IGt2bWd0X21wdCA9IHsKPj4gICAJLmRtYV9tYXBfZ3Vlc3RfcGFnZSA9IGt2bWd0X2RtYV9t
YXBfZ3Vlc3RfcGFnZSwKPj4gICAJLmRtYV91bm1hcF9ndWVzdF9wYWdlID0ga3ZtZ3RfZG1hX3Vu
bWFwX2d1ZXN0X3BhZ2UsCj4+ICAgCS5zZXRfb3ByZWdpb24gPSBrdm1ndF9zZXRfb3ByZWdpb24s
Cj4+ICsJLmNsZWFuX3JlZ2lvbnMgPSBrdm1ndF9jbGVhbl9yZWdpb25zLAo+PiAgIAkuZ2V0X3Zm
aW9fZGV2aWNlID0ga3ZtZ3RfZ2V0X3ZmaW9fZGV2aWNlLAo+PiAgIAkucHV0X3ZmaW9fZGV2aWNl
ID0ga3ZtZ3RfcHV0X3ZmaW9fZGV2aWNlLAo+PiAgIAkuaXNfdmFsaWRfZ2ZuID0ga3ZtZ3RfaXNf
dmFsaWRfZ2ZuLAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5o
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oCj4+IGluZGV4IDliNDIyNWQuLjFhMDc5
OTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaAo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmgKPj4gQEAgLTMxNCw2ICszMTQsMjAgQEAg
c3RhdGljIGlubGluZSBpbnQgaW50ZWxfZ3Z0X2h5cGVydmlzb3Jfc2V0X29wcmVnaW9uKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1KQo+PiAgIH0KPj4gICAKPj4gICAvKioKPj4gKyAqIGludGVsX2d2
dF9oeXBlcnZpc29yX2NsZWFuX3JlZ2lvbnMgLSBDbGVhbiByZWdpb25zIGZvciBndWVzdAo+PiAr
ICogQHZncHU6IGEgdkdQVQo+PiArICoKPj4gKyAqLwo+PiArc3RhdGljIGlubGluZSB2b2lkIGlu
dGVsX2d2dF9oeXBlcnZpc29yX2NsZWFuX3JlZ2lvbnMoc3RydWN0IGludGVsX3ZncHUgKnZncHUp
Cj4+ICt7Cj4+ICsJaWYgKCFpbnRlbF9ndnRfaG9zdC5tcHQtPmNsZWFuX3JlZ2lvbnMpCj4+ICsJ
CXJldHVybjsKPj4gKwo+PiArCWludGVsX2d2dF9ob3N0Lm1wdC0+Y2xlYW5fcmVnaW9ucyh2Z3B1
KTsKPj4gK30KPj4gKwo+PiArCj4+ICsvKioKPj4gICAgKiBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9n
ZXRfdmZpb19kZXZpY2UgLSBpbmNyZWFzZSB2ZmlvIGRldmljZSByZWYgY291bnQKPj4gICAgKiBA
dmdwdTogYSB2R1BVCj4+ICAgICoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCj4+IGluZGV4IGUx
Yzg2MGY4Li5jNWViNTY1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKPj4gQEAgLTI3
Niw2ICsyNzYsNyBAQCB2b2lkIGludGVsX2d2dF9kZXN0cm95X3ZncHUoc3RydWN0IGludGVsX3Zn
cHUgKnZncHUpCj4+ICAgCj4+ICAgCVdBUk4odmdwdS0+YWN0aXZlLCAidkdQVSBpcyBzdGlsbCBh
Y3RpdmUhXG4iKTsKPj4gICAKPj4gKwlpbnRlbF9ndnRfaHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25z
KHZncHUpOwo+PiAgIAlpbnRlbF9ndnRfZGVidWdmc19yZW1vdmVfdmdwdSh2Z3B1KTsKPj4gICAJ
aW50ZWxfdmdwdV9jbGVhbl9zY2hlZF9wb2xpY3kodmdwdSk7Cj4+ICAgCWludGVsX3ZncHVfY2xl
YW5fc3VibWlzc2lvbih2Z3B1KTsKPj4gLS0gCj4+IDIuNy40Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
