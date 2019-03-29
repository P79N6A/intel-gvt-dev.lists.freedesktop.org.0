Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1511964ywb;
        Fri, 29 Mar 2019 00:15:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5V4IY5xx4SGuGUFEIzXjMp5qFdeMiK8443KKuqik0DL9KeYvfgT3MSBX1VydgAd46w0sK
X-Received: by 2002:a63:5b64:: with SMTP id l36mr45181089pgm.182.1553843741564;
        Fri, 29 Mar 2019 00:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553843741; cv=none;
        d=google.com; s=arc-20160816;
        b=vDGr2SyJx85SLYpkvEjkWU08VQAO5Kd5B78U6Bkzzo1BQO7avnsGb/F3ZPZuJJRa0s
         nZLoozW06L1slN1cNw2a4w5eLIUUUoIZkrhA7xTORp9ipSj+maoLGj3gvKK+OoH6yIAU
         bcoL4+0Kk9iYh+JgwG44cfD+MsTDB2Xan7/KjOge9BX9Hu2fk1bW9cReHdVW/nMkYUbI
         3uxDtNeURZbtXHF4JR2YQZ9sPjARAUMer7dNS3PJJC/uaCPq6W2hl6eO6k7u06DWj22e
         ABXmVm5npW9HeObq+mNXptITBFwRuL4TQuSd1eHhktBT0KoQbZTVNaBgv94gu3KhPYxH
         gRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=zWQIa6Qrw8n0Jw941RMu3EDx4lOwONYYJBMXRntp1kc=;
        b=zOdFyDVxWbkBS65Wh/bDz9RNgUOORxHpHG/1a+B4Mu+ZGhOZICVE37XbxUv34lGYnN
         1AED9tyXnr2KTkMaMeSHd2cjF4SXW9fb2GEFBuhVtyZ3gPzSKS3ARNH3I3gHRG3Lcbub
         GN1N9tnwDQj/Cu2lPO+rBeXwNiKAMNwPZPLXZ4PPVJ7C7MN3dNdjNlDcb1GEUgD5wUdt
         SJCIoOcwIteGlunlsZVb6o/pxwAvlgtEmtvktUXRo3wIyslBwcMehsDf3lHp+yuQHqBn
         URcT3BI7O27VGWjbDRom4KY25aOp90lvbhU3LNVNWm3ToQ9CvrSTbmiHLpWteGaGqIrV
         zSoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id o86si1121139pfa.270.2019.03.29.00.15.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 00:15:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A213C6E84B;
	Fri, 29 Mar 2019 07:15:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0826E84A;
 Fri, 29 Mar 2019 07:15:38 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16057731-1500050 for multiple; Fri, 29 Mar 2019 07:15:15 +0000
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
 <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <155384371225.24691.4461093612777355542@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Date: Fri, 29 Mar 2019 07:15:12 +0000
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTAzLTI5IDEzOjMyOjQwKQo+IEl0IGlzIHBlcmZv
cm1hbmNlIG9wdGltaXphdGlvbiB0byBvdmVycmlkZSB0aGUgYWN0dWFsIHN1Ym1pc2lzb24gYmFj
a2VuZAo+IGluIG9yZGVyIHRvIGVsaW1pbmF0ZSBleGVjbGlzdHMgY3NiIHByb2Nlc3MgYW5kIHJl
ZHVjZSBtbWlvIHRyYXAgbnVtYmVycwo+IGZvciB3b3JrbG9hZCBzdWJtaXNzaW9uIHdpdGhvdXQg
Y29udGV4dHN3aXRoIGludGVycnVwdCBieSB0YWxraW5nIHdpdGgKPiBHVlQgdmlhIFBWIHN1Ym1p
c2lzb24gbm90aWZpY2F0aW9uIG1lY2hhbmlzbSBiZXR3ZWVuIGd1ZXN0IGFuZCBHVlQuCgo+IFVz
ZSBQVl9TVUJNSVNTSU9OIHRvIGNvbnRyb2wgdGhpcyBsZXZlbCBvZiBwdiBvcHRpbWl6YXRpb24u
Cj4gCj4gdjA6IFJGQwo+IHYxOiByZWJhc2UKPiB2MjogYWRkZWQgcHYgb3BzIGZvciBwdiBjb250
ZXh0IHN1Ym1pc3Npb24uIHRvIG1heGltaXplIGNvZGUgcmVzdXNlLAo+IGludHJvZHVjZWQgMiBt
b3JlIG9wcyAoc3VibWl0X3BvcnRzICYgcHJlZW1wdF9jb250ZXh0KSBpbnN0ZWFkIG9mIDEgb3AK
PiAoc2V0X2RlZmF1bHRfc3VibWlzc2lvbikgaW4gZW5naW5lIHN0cnVjdHVyZS4gcHYgdmVyc2lv
biBvZgo+IHN1Ym1pdF9wb3J0cyBhbmQgcHJlZW1wdF9jb250ZXh0IGltcGxlbWVudGVkLgo+IHYz
Ogo+IDEuIHRvIHJlZHVjZSBtb3JlIGNvZGUgZHVwbGljYXRpb24sIGNvZGUgcmVmYWN0b3IgYW5k
IHJlcGxhY2VkIDIgb3BzCj4gInN1Ym1pdF9wb3J0cyAmIHByZWVtcHRfY29udGV4IiBmcm9tIHYy
IGJ5IDEgb3BzICJ3cml0ZV9kZXNjIgo+IGluIGVuZ2luZSBzdHJ1Y3R1cmUuIHB2IHZlcnNpb24g
b2Ygd3JpdGVfZGVzIGltcGxlbWVudGVkLgo+IDIuIGFkZGVkIFZHVF9HMlZfRUxTUF9TVUJNSVQg
Zm9yIGcydiBwdiBub3RpZmljYXRpb24uCj4gdjQ6IGltcGxlbWVudGVkIHB2IGVsc3Agc3VibWlz
c2lvbiB0YXNrbGV0IGFzIHRoZSBiYWNrZW5kIHdvcmtsb2FkCj4gc3VibWlzaXNvbiBieSB0YWxr
aW5nIHRvIEdWVCB3aXRoIFBWIG5vdGlmaWNhaXRvbiBtZWNoYW5pc20gYW5kIHJlbmFtZWQKPiBW
R1RfRzJWX0VMU1BfU1VCTUlUIHRvIFZHVF9HMlZfUFZfU1VCTUlTSUlPTi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYyAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcHZpbmZvLmggfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3ZncHUuYyAgIHwgMTU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmggICB8ICAxMCArKysKPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMgICB8ICAgMyArCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTczIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJx
LmMKPiBpbmRleCAyZjc4ODI5Li4yOGU4ZWUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfaXJxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5j
Cj4gQEAgLTM3LDYgKzM3LDcgQEAKPiAgI2luY2x1ZGUgImk5MTVfZHJ2LmgiCj4gICNpbmNsdWRl
ICJpOTE1X3RyYWNlLmgiCj4gICNpbmNsdWRlICJpbnRlbF9kcnYuaCIKPiArI2luY2x1ZGUgImk5
MTVfdmdwdS5oIgo+ICAKPiAgLyoqCj4gICAqIERPQzogaW50ZXJydXB0IGhhbmRsaW5nCj4gQEAg
LTE0NzAsNiArMTQ3MSw3IEBAIGdlbjhfY3NfaXJxX2hhbmRsZXIoc3RydWN0IGludGVsX2VuZ2lu
ZV9jcyAqZW5naW5lLCB1MzIgaWlyKQo+ICAgICAgICAgaWYgKGlpciAmIEdUX1JFTkRFUl9VU0VS
X0lOVEVSUlVQVCkgewo+ICAgICAgICAgICAgICAgICBpbnRlbF9lbmdpbmVfYnJlYWRjcnVtYnNf
aXJxKGVuZ2luZSk7Cj4gICAgICAgICAgICAgICAgIHRhc2tsZXQgfD0gVVNFU19HVUNfU1VCTUlT
U0lPTihlbmdpbmUtPmk5MTUpOwo+ICsgICAgICAgICAgICAgICB0YXNrbGV0IHw9IFVTRVNfUFZf
U1VCTUlTU0lPTihlbmdpbmUtPmk5MTUpOwoKWW91IGNhbGwgdGhpcyBhbiBvcHRpbWlzYXRpb24h
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
