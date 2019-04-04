Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1149290ywo;
        Thu, 4 Apr 2019 01:12:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw67F0+Hxk6OkYn3sHAylQ0A23ohEo7Q9BxgyiHhWLxwmRmsTogb82pE4ZGlm4pf2IvP/4V
X-Received: by 2002:a63:e554:: with SMTP id z20mr4447794pgj.234.1554365538739;
        Thu, 04 Apr 2019 01:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554365538; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjVB/n97FHdXmlL7KkUlWgsggt0XaJ3lkQcaQzBfCtT+TcFvqhjWfVhjFMroLSkUca
         +SpQEncwGhZUzRntbGYmcv2atgLjHHhTyVG/OURIflYR0rZ74HTYnrEsqTD5aDH+CSWe
         h/61NdjAtZXK1VMXhvoz3rxSO0d/ieqkP/LtFjEv6rbTB2NO5EFpk/LUrl4Yc5lVnXyP
         bfQBdzfTtYdhzbaS3fYcY6RaKxERW4wh3hBD7ha7ED7YMk2Rt6FrBoohNqH/KIGMi9H1
         aCMPh2Saoplck2QwLUAWnbHJZg76GORo0uO1HvTZsYVDkdHGeW5qMsY0JVjBMecdSWET
         m8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=i5xUzwWw7H2ddyjYthe6Ouku1RHUbnB+LC5lmugRBY4=;
        b=COcp20u/kTgrkmVNvXqyEMOurshJL6arOcvUkIJvCx40X+g1Y9eB7A0SSOsGkBxpDA
         kO++ZG2Zvk80vrIbRKmz3JUWrB9DWIaRryCdcSQs5yd4p2rRROaK1T6V583LVAWEHtCk
         XWrS8foT4ZqvZgQ92NMJ84UYY09bhhZW+f+0UFnZutcjLqc/qBSBBretm9D2952vTWnC
         gpWX6elC0KqGzcwxfaXp+G1HuqmreK+w66ocIW2WwLFwywY1bEb67dXE5Gq5FNlCcVGr
         xmro0BS7GrOfxYTdB+PUxvUnMPKgWUSYgRTq+a2HgEmVQWhJB/OAlBFgqzJSEgVKxJDw
         /H0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k8si7709299plt.354.2019.04.04.01.12.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 01:12:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B50F6E557;
	Thu,  4 Apr 2019 08:12:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5586E557;
 Thu,  4 Apr 2019 08:12:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16125941-1500050 for multiple; Thu, 04 Apr 2019 09:11:57 +0100
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190404074834.GS2322@zhen-hp.sh.intel.com>
References: <20190404073056.12407-1-chris@chris-wilson.co.uk>
 <20190404074834.GS2322@zhen-hp.sh.intel.com>
Message-ID: <155436551568.7532.6039435513500149424@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915/gvt: Prevent use-after-free in
 ppgtt_free_all_spt()
Date: Thu, 04 Apr 2019 09:11:55 +0100
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wNC0wNCAwODo0ODozNCkKPiBPbiAyMDE5LjA0LjA0
IDA4OjMwOjU2ICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBwcGd0dF9mcmVlX2FsbF9z
cHQoKSBpdGVyYXRlcyB0aGUgcmFkaXh0cmVlIGFzIGl0IGlzIGRlbGV0aW5nIGl0LAo+ID4gZm9y
Z29pbmcgYWxsIHByb3RlY3Rpb24gYWdhaW5zdCB0aGUgbGVhdmVzIGJlaW5nIGZyZWVkIGluIHRo
ZSBwcm9jZXNzCj4gPiAobGVhdmluZyB0aGUgaXRlciBwb2ludGluZyBpbnRvIHRoZSB2b2lkKS4K
PiA+IAo+ID4gQSBtaW5pbWFsIGZpeCBzZWVtcyB0byBiZSB0byB1c2UgdGhlIGF2YWlsYWJsZSBw
b3N0X3NoYWRvd19saXN0IHRvCj4gPiBkZWNvbXBvc2UgdGhlIHRyZWUgaW50byBhIGxpc3QgcHJp
b3IgdG8gZGVzdHJveWluZyB0aGUgcmFkaXh0cmVlLgo+ID4gCj4gPiBBbGVydGVkIGJ5IHRoZSBz
cGFyc2Ugd2FybmluZ3M6Cj4gPiAKPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3
NTc6OTogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGFk
ZHJlc3Mgc3BhY2VzKQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiAg
ICBleHBlY3RlZCB2b2lkICoqc2xvdAo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
Ojc1Nzo5OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gPGFzbjo0PiAqKgo+ID4gZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3Np
Z25tZW50IChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmM6NzU3Ojk6ICAgIGV4cGVjdGVkIHZvaWQgKipzbG90Cj4gPiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU3Ojk6ICAgIGdvdCB2b2lkIFtub2RlcmVmXSA8YXNuOjQ+
ICoqCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU4OjQ1OiB3YXJuaW5nOiBp
bmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAxIChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCj4g
PiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU4OjQ1OiAgICBleHBlY3RlZCB2b2lk
IFtub2RlcmVmXSA8YXNuOjQ+ICoqc2xvdAo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jOjc1ODo0NTogICAgZ290IHZvaWQgKipzbG90Cj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmM6NzU3Ojk6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDEgKGRp
ZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Yzo3NTc6OTogICAgZXhwZWN0ZWQgdm9pZCBbbm9kZXJlZl0gPGFzbjo0PiAqKnNsb3QKPiA+IGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3NTc6OTogICAgZ290IHZvaWQgKipzbG90Cj4g
PiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU3Ojk6IHdhcm5pbmc6IGluY29ycmVj
dCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKPiA+IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3NTc6OTogICAgZXhwZWN0ZWQgdm9pZCAqKnNsb3QK
PiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3NTc6OTogICAgZ290IHZvaWQgW25v
ZGVyZWZdIDxhc246ND4gKioKPiA+IAo+ID4gVGhpcyB3b3VsZCBhbHNvIGhhdmUgYmVlbiBsb3Vk
bHkgd2FybmluZyBpZiBydW4gdGhyb3VnaCBDSSBmb3IgdGhlCj4gPiBpbnZhbGlkIFJDVSBkZXJl
ZmVyZW5jZXMuCj4gPiAKPiA+IEZpeGVzOiBiNmMxMjZhMzkzNDUgKCJkcm0vaTkxNS9ndnQ6IE1h
bmFnZSBzaGFkb3cgcGFnZXMgd2l0aCByYWRpeCB0cmVlIikKPiA+IFNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IENoYW5nYmluIER1
IDxjaGFuZ2Jpbi5kdUBpbnRlbC5jb20+Cj4gPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGlu
dXguaW50ZWwuY29tPgo+ID4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDEyICsrKysrKysrKy0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPiA+IGluZGV4IGNmMTMzZWYwMzg3My4uOTgxNDc3
Mzg4MmVjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPiA+IEBAIC03NTAsMTQgKzc1
MCwyMCBAQCBzdGF0aWMgdm9pZCBwcGd0dF9mcmVlX3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0
dF9zcHQgKnNwdCkKPiA+ICAKPiA+ICBzdGF0aWMgdm9pZCBwcGd0dF9mcmVlX2FsbF9zcHQoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUpCj4gPiAgewo+ID4gLSAgICAgc3RydWN0IGludGVsX3ZncHVf
cHBndHRfc3B0ICpzcHQ7Cj4gPiArICAgICBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNw
dCwgKnNwbjsKPiA+ICAgICAgIHN0cnVjdCByYWRpeF90cmVlX2l0ZXIgaXRlcjsKPiA+IC0gICAg
IHZvaWQgKipzbG90Owo+ID4gKyAgICAgTElTVF9IRUFEKGFsbF9zcHQpOwo+ID4gKyAgICAgdm9p
ZCBfX3JjdSAqKnNsb3Q7Cj4gPiAgCj4gPiArICAgICByY3VfcmVhZF9sb2NrKCk7Cj4gPiAgICAg
ICByYWRpeF90cmVlX2Zvcl9lYWNoX3Nsb3Qoc2xvdCwgJnZncHUtPmd0dC5zcHRfdHJlZSwgJml0
ZXIsIDApIHsKPiA+ICAgICAgICAgICAgICAgc3B0ID0gcmFkaXhfdHJlZV9kZXJlZl9zbG90KHNs
b3QpOwo+ID4gLSAgICAgICAgICAgICBwcGd0dF9mcmVlX3NwdChzcHQpOwo+ID4gKyAgICAgICAg
ICAgICBsaXN0X21vdmUoJnNwdC0+cG9zdF9zaGFkb3dfbGlzdCwgJmFsbF9zcHQpOwo+ID4gICAg
ICAgfQo+ID4gKyAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiArCj4gPiArICAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUoc3B0LCBzcG4sICZhbGxfc3B0LCBwb3N0X3NoYWRvd19saXN0KQo+
ID4gKyAgICAgICAgICAgICBwcGd0dF9mcmVlX3NwdChzcHQpOwo+ID4gIH0KPiA+Cj4gCj4gQXMg
d2UgZW5zdXJlIHRvIGZsdXNoIHBvc3Qgc2hhZG93IGxpc3QsIHNvIHRoaXMgaXMgc2FmZSB0byBy
ZXVzZS4KClBoZXchIEkgbG9va2VkLCBjb3VsZG4ndCBzZWUgdGhhdCBpdCB3b3VsZCBiZSB1c2Vk
IGF0IHRoaXMgcG9pbnQsIHNvCmhvcGVkIGZvciB0aGUgYmVzdC4KIAo+IFJldmlld2VkLWJ5OiBa
aGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CgpXaWxsIHlvdSB0YWtlIGJvdGgg
b2YgdGhlc2UgcGF0Y2hlcyB0aHJvdWdoIHlvdXIgdHJlZT8KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
