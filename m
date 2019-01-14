Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2666230ywd;
        Sun, 13 Jan 2019 21:42:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ogE/w0YGCjFbkkhA1lGuRFRfDly6ECa2JXKDLLjn9pcEN0r8wTLu7kf7uaFCxzg5D8bfG
X-Received: by 2002:a17:902:f44:: with SMTP id 62mr24240073ply.38.1547444521925;
        Sun, 13 Jan 2019 21:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547444521; cv=none;
        d=google.com; s=arc-20160816;
        b=yV+d1HqVvQTeuBOJr4xvifx7brNInjAMpBN/qKg82Ts2rdvX/84aAEPZn6RBqb+QEj
         KEH/8+Oas34xpwGaVRbh/zYLlbQ0dDqpqEaF/Mm4achGUqwC9ZG5SQLzCT/JCZgQuTfK
         A1+UclSR6GRAsRL/Ge2WrV7Vcuc6j4NAIVeSGHO6a7+YK4fHRJrEe6a+n/N2DsySdPBZ
         EFYM2SKyW6fXCDXbOqwd64jHt5pvi0scIhfl7eMHSiUGvhbksnrIxMFx0efOIkfxlT2S
         dqag3765LkX+HExiA2qRC7PJl3W4+FdTNMcOxD+h2OXwZRMZ2FRKbynyajpGA29xmj1N
         1pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=06iyGTq3VI+slG9cMVGG01vD/q353H03MlBq35DlV8A=;
        b=wGwiM1SkIq1uDfgHNAjV1eYHgUrySmOcWNj75BxuG7pMlv1rswBbYvdGz5ZLVhLb8p
         ynRKF7CogFJW7626AtCuOp6mbJ3K+buKpOe8LnkdA/UxjsIlV7k+ZlGALbt6KLxl6QhA
         KOYOAMdxnPjvq4i1OXxkU8sYsTJE1qZ/JYqKlKC/e+ro0FgO9jqDS/WAtgGAAHTAGm7t
         seIhrGZlxNYuVjryu5rSWjF9PLoACLLGyrW78xbLkpVhWsHpqvCl1/tMO2eQwja7/128
         1Zz/jLUu9OXDIBhtbZScjnNznik46zBUHIh/PiRtqQzdhola+HOK+qaRoc4P26JYwQlv
         41EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q20si17330332pll.255.2019.01.13.21.42.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 21:42:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254B96E043;
	Mon, 14 Jan 2019 05:42:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E726E043
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 05:41:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 21:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; d="scan'208";a="106379076"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.81])
 ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2019 21:41:38 -0800
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
 <20190114050557.GZ11631@zhen-hp.sh.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
Date: Mon, 14 Jan 2019 13:34:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190114050557.GZ11631@zhen-hp.sh.intel.com>
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

T24gMS8xNC8xOSAxOjA1IFBNLCBaaGVueXUgV2FuZyB3cm90ZToKPiBPbiAyMDE5LjAxLjE0IDEz
OjAyOjI0ICswODAwLCBIYW5nIFl1YW4gd3JvdGU6Cj4+IE9uIDEvMTQvMTkgMTE6NTYgQU0sIFpo
ZW55dSBXYW5nIHdyb3RlOgo+Pj4gT24gMjAxOS4wMS4xMCAxOTowNDo0NSArMDgwMCwgaGFuZy55
dWFuQGxpbnV4LmludGVsLmNvbSB3cm90ZToKPj4+PiBGcm9tOiBIYW5nIFl1YW4gPGhhbmcueXVh
bkBsaW51eC5pbnRlbC5jb20+Cj4+Pj4KPj4+PiBBZGQgb25lIGh5cGVyY2FsbCB0byBmcmVlIFZG
SU8gcmVnaW9uIG1lbW9yeS4gQWxzbyBjYWxsIGl0IGluIHZncHUKPj4+PiBkZXN0cm95Lgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29t
Pgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCB8
ICAxICsKPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgfCAxNSAr
KysrKysrKysrKysrKysKPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmggICAg
ICAgfCAxNCArKysrKysrKysrKysrKwo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92
Z3B1LmMgICAgICB8ICAxICsKPj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJj
YWxsLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgKPj4+PiBpbmRleCA1
MDc5ODg2Li4yYWI0MTM4IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oeXBlcmNhbGwuaAo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNh
bGwuaAo+Pj4+IEBAIC02Nyw2ICs2Nyw3IEBAIHN0cnVjdCBpbnRlbF9ndnRfbXB0IHsKPj4+PiAg
ICAJaW50ICgqc2V0X3RyYXBfYXJlYSkodW5zaWduZWQgbG9uZyBoYW5kbGUsIHU2NCBzdGFydCwg
dTY0IGVuZCwKPj4+PiAgICAJCQkgICAgIGJvb2wgbWFwKTsKPj4+PiAgICAJaW50ICgqc2V0X29w
cmVnaW9uKSh2b2lkICp2Z3B1KTsKPj4+PiArCXZvaWQgKCpjbGVhbl9yZWdpb25zKSh2b2lkICp2
Z3B1KTsKPj4+PiAgICAJaW50ICgqZ2V0X3ZmaW9fZGV2aWNlKSh2b2lkICp2Z3B1KTsKPj4+PiAg
ICAJdm9pZCAoKnB1dF92ZmlvX2RldmljZSkodm9pZCAqdmdwdSk7Cj4+Pj4gICAgCWJvb2wgKCpp
c192YWxpZF9nZm4pKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1bnNpZ25lZCBsb25nIGdmbik7Cj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+Pj4gaW5kZXggYTE5ZTY4NC4uOGMzMGRj
MyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+Pj4gQEAgLTQ5Myw2ICs0
OTMsMjAgQEAgc3RhdGljIGludCBrdm1ndF9zZXRfb3ByZWdpb24odm9pZCAqcF92Z3B1KQo+Pj4+
ICAgIAlyZXR1cm4gcmV0Owo+Pj4+ICAgIH0KPj4+PiArc3RhdGljIHZvaWQga3ZtZ3RfY2xlYW5f
cmVnaW9ucyh2b2lkICpwX3ZncHUpCj4+Pj4gK3sKPj4+PiArCWludCBpOwo+Pj4+ICsJc3RydWN0
IGludGVsX3ZncHUgKnZncHUgPSAoc3RydWN0IGludGVsX3ZncHUgKilwX3ZncHU7Cj4+Pj4gKwo+
Pj4+ICsJZm9yIChpID0gMDsgaSA8IHZncHUtPnZkZXYubnVtX3JlZ2lvbnM7IGkrKykKPj4+PiAr
CQlpZiAodmdwdS0+dmRldi5yZWdpb25baV0ub3BzLT5yZWxlYXNlKQo+Pj4+ICsJCQl2Z3B1LT52
ZGV2LnJlZ2lvbltpXS5vcHMtPnJlbGVhc2UodmdwdSwKPj4+PiArCQkJCQkmdmdwdS0+dmRldi5y
ZWdpb25baV0pOwo+Pj4+ICsJdmdwdS0+dmRldi5udW1fcmVnaW9ucyA9IDA7Cj4+Pj4gKwlrZnJl
ZSh2Z3B1LT52ZGV2LnJlZ2lvbik7Cj4+Pj4gKwl2Z3B1LT52ZGV2LnJlZ2lvbiA9IE5VTEw7Cj4+
Pj4gK30KPj4+Cj4+PiBJdCBsb29rcyBhIGxpdHRsZSBvdmVya2lsbCB0byBwdXQgdGhpcyByZXF1
aXJlbW50IG9uIGFsbCBoeXBlcnZpc29yLAo+Pj4gYXMgVkZJTyByZWdpb24gaXMgS1ZNR1Qgb25s
eSB0aGluZywgZS5nIG1pZ2h0IG5vdCBiZSB2YWxpZCBmb3Igb3RoZXIgaHlwZXJ2aXNvci4KPj4+
IEFuZCBsb29rcyBvdXIgcmVnaW9uLm9wcy5yZWxlYXNlIGlzIG5ldmVyIGFjdHVhbGx5IHVzZWZ1
bCwgd2hhdCB3ZSBuZWVkCj4+PiBpcyB0byBmcmVlIHVwIHZncHUgcmVnaW9ucywgbWF5YmUganVz
dCBhdCBkZXRhY2ggdmdwdSB0aW1lIHRvIGxldCBoeXBlcnZpc29yCj4+PiBkbyBhbnkgY2xlYW51
cCByZXF1aXJlZC4KPj4+Cj4+IEhlbnJ5OlNpbmNlIHRoZXJlIGlzIGFscmVhZHkgaHlwZXJjYWxs
ICdzZXRfb3ByZWdpb24nLCBJIHVzZSBoeXBlcmNhbGwgYXMKPj4gd2VsbCB0byBkbyByZWdpb24g
Y2xlYW4gZm9yIG9wcmVnaW9uIGFuZCBlZGlkIHJlZ2lvbiB0byBoYXZlIGNvbnNpc3RlbnQKPj4g
aW50ZXJmYWNlIGJldHdlZW4gZ3Z0IGFuZCBoeXBlcnZpc29yLiAnY2xlYW5fcmVnaW9ucycgd2ls
bCBhbHNvIGJlIGNhbGxlZCBpZgo+PiBmYWlsdXJlIGluIHZncHUgY3JlYXRlLiBTbyBJIGRpZG4n
dCBpbXBsZW1lbnQgaXQgaW4gdmdwdSBkZXRhY2guCj4+Cj4gCj4gInNldF9vcHJlZ2lvbiIgaHlw
ZXJjYWxsIG1lYW5zIGh5cGVydmlzb3IgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgd2F5cyB0bwo+IGV4
cG9zZSBvcHJlZ2lvbiwgZS5nIHRocm91Z2ggdmZpbyByZWdpb24sIGV0Yy4gU28gdGhhdCBtYWtl
cyBzZW5zZSBmb3IgYQo+IG1wdCBpbnRlcmZhY2UuIEJ1dCBoZXJlIG9ubHkgY2FyZSBhYm91dCBj
bGVhbnVwIG9mIFZGSU8gcmVnaW9uLCBhbmQgYm90aAo+IG9wcmVnaW9uIGFuZCBlZGlkIHJlZ2lv
bidzIHJlbGVhc2UgZnVuY3Rpb24gaXMgbm9vcC4uCj4gCkhlbnJ5OiBTbyBkbyB5b3UgbWVhbiB0
byBleHBvc2UgdGhlIGZ1bmN0aW9ucyAoY2xlYW5fcmVnaW9ucy9zZXRfZWRpZCkgCmluIGt2bWd0
IGluc3RlYWQgb2YgaHlwZXJjYWxsIGlmIHRoZSBmdW5jdGlvbiBpcyBvbmx5IHZhbGlkIGZvciBL
Vk0/Cgo+Pj4+ICsKPj4+PiAgICBzdGF0aWMgdm9pZCBrdm1ndF9wdXRfdmZpb19kZXZpY2Uodm9p
ZCAqdmdwdSkKPj4+PiAgICB7Cj4+Pj4gICAgCWlmIChXQVJOX09OKCEoKHN0cnVjdCBpbnRlbF92
Z3B1ICopdmdwdSktPnZkZXYudmZpb19kZXZpY2UpKQo+Pj4+IEBAIC0xODc0LDYgKzE4ODgsNyBA
QCBzdGF0aWMgc3RydWN0IGludGVsX2d2dF9tcHQga3ZtZ3RfbXB0ID0gewo+Pj4+ICAgIAkuZG1h
X21hcF9ndWVzdF9wYWdlID0ga3ZtZ3RfZG1hX21hcF9ndWVzdF9wYWdlLAo+Pj4+ICAgIAkuZG1h
X3VubWFwX2d1ZXN0X3BhZ2UgPSBrdm1ndF9kbWFfdW5tYXBfZ3Vlc3RfcGFnZSwKPj4+PiAgICAJ
LnNldF9vcHJlZ2lvbiA9IGt2bWd0X3NldF9vcHJlZ2lvbiwKPj4+PiArCS5jbGVhbl9yZWdpb25z
ID0ga3ZtZ3RfY2xlYW5fcmVnaW9ucywKPj4+PiAgICAJLmdldF92ZmlvX2RldmljZSA9IGt2bWd0
X2dldF92ZmlvX2RldmljZSwKPj4+PiAgICAJLnB1dF92ZmlvX2RldmljZSA9IGt2bWd0X3B1dF92
ZmlvX2RldmljZSwKPj4+PiAgICAJLmlzX3ZhbGlkX2dmbiA9IGt2bWd0X2lzX3ZhbGlkX2dmbiwK
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oCj4+Pj4gaW5kZXggOWI0MjI1ZC4uMWEwNzk5NCAxMDA2
NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmgKPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmgKPj4+PiBAQCAtMzE0LDYgKzMxNCwyMCBAQCBz
dGF0aWMgaW5saW5lIGludCBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9zZXRfb3ByZWdpb24oc3RydWN0
IGludGVsX3ZncHUgKnZncHUpCj4+Pj4gICAgfQo+Pj4+ICAgIC8qKgo+Pj4+ICsgKiBpbnRlbF9n
dnRfaHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25zIC0gQ2xlYW4gcmVnaW9ucyBmb3IgZ3Vlc3QKPj4+
PiArICogQHZncHU6IGEgdkdQVQo+Pj4+ICsgKgo+Pj4+ICsgKi8KPj4+PiArc3RhdGljIGlubGlu
ZSB2b2lkIGludGVsX2d2dF9oeXBlcnZpc29yX2NsZWFuX3JlZ2lvbnMoc3RydWN0IGludGVsX3Zn
cHUgKnZncHUpCj4+Pj4gK3sKPj4+PiArCWlmICghaW50ZWxfZ3Z0X2hvc3QubXB0LT5jbGVhbl9y
ZWdpb25zKQo+Pj4+ICsJCXJldHVybjsKPj4+PiArCj4+Pj4gKwlpbnRlbF9ndnRfaG9zdC5tcHQt
PmNsZWFuX3JlZ2lvbnModmdwdSk7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gKwo+Pj4+ICsvKioKPj4+
PiAgICAgKiBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9nZXRfdmZpb19kZXZpY2UgLSBpbmNyZWFzZSB2
ZmlvIGRldmljZSByZWYgY291bnQKPj4+PiAgICAgKiBAdmdwdTogYSB2R1BVCj4+Pj4gICAgICoK
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKPj4+PiBpbmRleCBlMWM4NjBmOC4uYzVlYjU2NSAx
MDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwo+Pj4+IEBAIC0yNzYsNiArMjc2LDcg
QEAgdm9pZCBpbnRlbF9ndnRfZGVzdHJveV92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQo+
Pj4+ICAgIAlXQVJOKHZncHUtPmFjdGl2ZSwgInZHUFUgaXMgc3RpbGwgYWN0aXZlIVxuIik7Cj4+
Pj4gKwlpbnRlbF9ndnRfaHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25zKHZncHUpOwo+Pj4+ICAgIAlp
bnRlbF9ndnRfZGVidWdmc19yZW1vdmVfdmdwdSh2Z3B1KTsKPj4+PiAgICAJaW50ZWxfdmdwdV9j
bGVhbl9zY2hlZF9wb2xpY3kodmdwdSk7Cj4+Pj4gICAgCWludGVsX3ZncHVfY2xlYW5fc3VibWlz
c2lvbih2Z3B1KTsKPj4+PiAtLSAKPj4+PiAyLjcuNApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
