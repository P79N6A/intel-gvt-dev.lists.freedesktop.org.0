Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5785027ywb;
        Wed, 27 Mar 2019 02:50:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPv2DxDqr1qsg3Tkv6CNePlT+ItHYllE5AVawPcwP6GQ6DuuO5kmaF7WC4lzDlgCYoH+kI
X-Received: by 2002:a63:ed0a:: with SMTP id d10mr33245022pgi.452.1553680244616;
        Wed, 27 Mar 2019 02:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553680244; cv=none;
        d=google.com; s=arc-20160816;
        b=cF4S4jEwB6Bye68U7qUxKbAmUFX70anurnuqqEdHggk2vHIN1jm/7jarH9ex+DmXZZ
         Aso/P6gA2ULKaoS8r/gJ4zneEHLdMLJTPNiWSo/oHFCgmv8NDytRQpgntc87ATuUGulS
         qXN154L1fx9PJMIf41NbxOoolFn1L0dCXJ4oapmDPsFT3KlWF8adP+5xxDfhJQDNBnYc
         SXYFtlwqrvAZxxK3EdaZosrTKIAohForU2otC6+WXKLxIcDTjw80gcmRP4vgpnXAekxJ
         8f6wVHiKsaSHW3bI4eSDX2Lu5ASz5WVFVEb7InteXOBsrjbxYNkGysNzfUMwEu6QnZW4
         KweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=3clFoUmKQELJXyOdwevqu46J6bjYkOLs21Ogl3AtcY4=;
        b=AK6kLaGa0qjVvVZ70zGr1pCob4/JvxUomBRi/RMGZarmcpgnYTbtkAsxYiiNn9TRl2
         ljg6osWQvnSdsKn7JlhcRjNGYGWdOyZSGOMAIsQAHwF8yESgqO3Yr4kzxnsMRGTY8f17
         1mPWlPWRH6gVUwwadMC8uTL5+4Eu+ZbgKv6lDoVODG2990HqqwR7FQvDgogQ8y77aOZ5
         dIb7aSKzIBDPli94+Jj39liCTk+hntZV/joWjNi0HcUuYy+HzanGaPCYkzxUurG/Mt1a
         13suk6p2ozQcXJXivy89yh9YZnRU606bvzy3I17CFTI3HOVzPKXs3FOHUiK+sdIUDdV7
         92Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h127si19017994pfb.213.2019.03.27.02.50.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 02:50:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C696E136;
	Wed, 27 Mar 2019 09:50:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC966E135;
 Wed, 27 Mar 2019 09:50:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16033207-1500050 for multiple; Wed, 27 Mar 2019 09:50:26 +0000
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190327090636.3547-1-zhenyuw@linux.intel.com>
References: <20190327090636.3547-1-zhenyuw@linux.intel.com>
Message-ID: <155368022555.24691.16837253354956451781@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Disable semaphore on vGPU for now
Date: Wed, 27 Mar 2019 09:50:25 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wMy0yNyAwOTowNjozNikKPiBUaGlzIGlzIHRvIGRp
c2FibGUgc2VtYXBob3JlIHVzYWdlIHdoZW4gb24gdkdQVSBmb3Igbm93LiBVbmZvcnR1bmF0ZWx5
Cj4gR1ZULWcgaGFzbid0IGZ1bGx5IGVuYWJsZWQgc2VtYXBob3JlIHVzYWdlIHlldCwgc28gY3Vy
cmVudCBndWVzdCB3aXRoCj4gc2VtYXBob3JlIHVzZSB3b3VsZCBjYXVzZSB2R1BVIGZhaWx1cmUu
Cj4gCj4gQWx0aG91Z2ggY3VycmVudCBzZW1hcGhvcmUgZmFpbHVyZSB3aXRoIHZHUFUgY2FuIGJl
IHNpbXBseSByZXNvbHZlZCBieQo+IGFsbG93aW5nIGNtZCBwYXJzZXIgdG8gYWNjZXB0IE1JX1NF
TUFQSE9SRV9XQUlUIGNvbW1hbmQgd2l0aCBhZGRyZXNzCj4gYXVkaXQsIHdlJ3JlIGNoZWNraW5n
IGdlbmVyYWwgdXNhZ2Ugb2Ygc2VtYXBob3JlIGFuZCBob3cgd2Ugc2hvdWxkCj4gaGFuZGxlIGl0
IHByb3Blcmx5IGZvciB2aXJ0dWFsaXphdGlvbiBpbiBjb25zaWRlciBvZiBmdW5jdGlvbiBhbmQK
PiBzZWN1cml0eSBjb25jZXJuLiBTbyB3ZSBkZWNpZGUgdG8gcmVxdWVzdCB0byBkaXNhYmxlIGl0
IGZvciBub3cgaW4KPiBndWVzdCBkcml2ZXIuIE9uY2UgR1ZUIGNvdWxkIHN1cHBvcnQgaXQsIHdl
IHdvdWxkIGFkZCBuZXcgY29tcGF0IGJpdAo+IHRvIHR1cm4gaXQgb24uCj4gCj4gQ2M6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNv
bT4KPiAtLS0KPiBOb3RlIHRoaXMgbmVlZHMgdG8gcXVldWUgZm9yIC1uZXh0IG90aGVyd2lzZSBu
ZXh0IGtlcm5lbCBpOTE1IGFzIGd1ZXN0Cj4gd291bGQgYmUgYnJva2VuIGZvciBHVlQuCj4gCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xyYy5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2xyYy5jCj4gaW5kZXggNjZiYzNjZDRlMTY2Li41MDA3NWUyNGFlMDMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9scmMuYwo+IEBAIC0yMzE1LDcgKzIzMTUsOCBAQCB2b2lkIGludGVsX2V4ZWNs
aXN0c19zZXRfZGVmYXVsdF9zdWJtaXNzaW9uKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2lu
ZSkKPiAgICAgICAgIGVuZ2luZS0+cGFyayA9IE5VTEw7Cj4gICAgICAgICBlbmdpbmUtPnVucGFy
ayA9IE5VTEw7Cj4gIAo+IC0gICAgICAgZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9IQVNf
U0VNQVBIT1JFUzsKPiArICAgICAgIGlmICghaW50ZWxfdmdwdV9hY3RpdmUoZW5naW5lLT5pOTE1
KSkKPiArICAgICAgICAgICAgICAgZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9IQVNfU0VN
QVBIT1JFUzsKCkZ3aXcsIHRoaXMgd2lsbCBoYXZlIHRoZSBkZXNpcmVkIGVmZmVjdCBzbywKCkFj
a2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCkp1c3QgdGhl
IHF1ZXN0aW9uIHJlbWFpbnMgYXMgdGhpcyBpcyBiZWluZyB1c2VkIGJ5IHVzZXJzcGFjZSwgc3dl
ZXBpbmcKaXQgdW5kZXIgdGhlIHJ1ZyBtaWdodCBiZSBhIGJpdCBtb3JlIGRpZmZpY3VsdC4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
