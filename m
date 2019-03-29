Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1993860ywb;
        Fri, 29 Mar 2019 08:40:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVwTCoY2+NS5m0BeR8bkJj6pdXxeB8yZuOJqENu4nRVx8QbOBAj4GZMidj+4e13y+iIDXU
X-Received: by 2002:aa7:820c:: with SMTP id k12mr23768355pfi.177.1553874030781;
        Fri, 29 Mar 2019 08:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553874030; cv=none;
        d=google.com; s=arc-20160816;
        b=rVCzEDc/r3bc3COvfr7KsC7g1TeG7Cauh+xN/ZFMmRRuOHgzEi+yQNaWCxFq676e7G
         ExhbeNKCXPu34H9l7K/cHMZLQaXzcSCPGT65m7iEnLfcy3tY0S0G40bsKZllh1cGDHk1
         Xx5JYfI9HzC5rVZ8TDwYE4YQbMxftzAExhRQlS/ehhIedd4ya8pY5n6nVvRe+ESFh8qu
         9HQV3iji8DEf+yynWXHbB8bmhht83lckVi7fEqJbagqTaz1SVquMkWUgYR6u+QiFtouV
         4ZFpoRhf9mU8TJEFSs4VBw1xLn2otniDq3DWsmmeaxPR8njEVLhxb85ju88NMlto5zdq
         4Svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=aySBietrl8jm+LNafOuRYjy2KICATEhYFTgg1k4Z3yk=;
        b=hDHiaIrCJSqktFMDqZWb6zZYUX+HQKGkfNDS57GlpgVPLjur1mXIWEiuPYhM2Xiuoj
         tLNa2QCsRFZrFzIija/rBpho8EBLBu5bvnonDr0OxY2WG0dByBMXyqYFDx6v+AhGAjmH
         tC22wW5ZD5T2sg+9qix5zY96Q4MWXhszUBAzee2gGvEzUgzMun+sEDvzVuNY+5KJRcEZ
         vVLvQkTJX2RtAYlRMDJOiNRLgy3+6hFGFrVT2LlGWfMuu95x9xLWH9Hm2WiPRBcxSyVk
         41qEK9u4bVxyfZVXzBPkg5JJHk0dp7wW5AYhIOezW5ZuJV5a9t3japWOSs8vAUUxz8UY
         S4Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r17si2181188pgm.52.2019.03.29.08.40.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 08:40:30 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A976E885;
	Fri, 29 Mar 2019 15:40:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193216E877;
 Fri, 29 Mar 2019 15:40:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16064477-1500050 for multiple; Fri, 29 Mar 2019 15:40:08 +0000
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
 <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <155387400537.24691.10910151885848243897@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Date: Fri, 29 Mar 2019 15:40:05 +0000
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

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTAzLTI5IDEzOjMyOjQwKQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9pcnEuYwo+IGluZGV4IDJmNzg4MjkuLjI4ZThlZTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfaXJxLmMKPiBAQCAtMzcsNiArMzcsNyBAQAo+ICAjaW5jbHVkZSAiaTkxNV9kcnYuaCIKPiAg
I2luY2x1ZGUgImk5MTVfdHJhY2UuaCIKPiAgI2luY2x1ZGUgImludGVsX2Rydi5oIgo+ICsjaW5j
bHVkZSAiaTkxNV92Z3B1LmgiCj4gIAo+ICAvKioKPiAgICogRE9DOiBpbnRlcnJ1cHQgaGFuZGxp
bmcKPiBAQCAtMTQ3MCw2ICsxNDcxLDcgQEAgZ2VuOF9jc19pcnFfaGFuZGxlcihzdHJ1Y3QgaW50
ZWxfZW5naW5lX2NzICplbmdpbmUsIHUzMiBpaXIpCj4gICAgICAgICBpZiAoaWlyICYgR1RfUkVO
REVSX1VTRVJfSU5URVJSVVBUKSB7Cj4gICAgICAgICAgICAgICAgIGludGVsX2VuZ2luZV9icmVh
ZGNydW1ic19pcnEoZW5naW5lKTsKPiAgICAgICAgICAgICAgICAgdGFza2xldCB8PSBVU0VTX0dV
Q19TVUJNSVNTSU9OKGVuZ2luZS0+aTkxNSk7Cj4gKyAgICAgICAgICAgICAgIHRhc2tsZXQgfD0g
VVNFU19QVl9TVUJNSVNTSU9OKGVuZ2luZS0+aTkxNSk7CgpXZSBzaG91bGQgbW92ZSB0aGlzIHRv
IGFuIGVuZ2luZS0+ZmxhZy4KCj4gICAgICAgICB9Cj4gIAo+ICAgICAgICAgaWYgKHRhc2tsZXQp
Cj4gK3N0YXRpYyB2b2lkIHZncHVfcHZfc2V0X2RlZmF1bHRfc3VibWlzc2lvbihzdHJ1Y3QgaW50
ZWxfZW5naW5lX2NzICplbmdpbmUpCj4gK3sKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBXZSBp
bmhlcml0IGEgYnVuY2ggb2YgZnVuY3Rpb25zIGZyb20gZXhlY2xpc3RzIHRoYXQgd2UnZCBsaWtl
Cj4gKyAgICAgICAgKiB0byBrZWVwIHVzaW5nOgo+ICsgICAgICAgICoKPiArICAgICAgICAqICAg
IGVuZ2luZS0+c3VibWl0X3JlcXVlc3QgPSBleGVjbGlzdHNfc3VibWl0X3JlcXVlc3Q7Cj4gKyAg
ICAgICAgKiAgICBlbmdpbmUtPmNhbmNlbF9yZXF1ZXN0cyA9IGV4ZWNsaXN0c19jYW5jZWxfcmVx
dWVzdHM7Cj4gKyAgICAgICAgKiAgICBlbmdpbmUtPnNjaGVkdWxlID0gZXhlY2xpc3RzX3NjaGVk
dWxlOwo+ICsgICAgICAgICoKPiArICAgICAgICAqIEJ1dCB3ZSBuZWVkIHRvIG92ZXJyaWRlIHRo
ZSBhY3R1YWwgc3VibWlzc2lvbiBiYWNrZW5kIGluIG9yZGVyCj4gKyAgICAgICAgKiB0byB0YWxr
IHRvIHRoZSBHVlQgd2l0aCBQViBub3RpZmljYXRpb24gbWVzc2FnZS4KPiArICAgICAgICAqLwo+
ICsgICAgICAgaW50ZWxfZXhlY2xpc3RzX3NldF9kZWZhdWx0X3N1Ym1pc3Npb24oZW5naW5lKTsK
PiArCj4gKyAgICAgICBlbmdpbmUtPmV4ZWNsaXN0cy50YXNrbGV0LmZ1bmMgPSB2Z3B1X3B2X3N1
Ym1pc3Npb25fdGFza2xldDsKCllvdSBuZWVkIHRvIHBpbiB0aGUgYnJlYWRjcnVtYnMgaXJxLCBv
ciBpdCB3aWxsIG5vdCBmaXJlIG9uIGV2ZXJ5CnJlcXVlc3QuCgpJJ2QgcHVzaCBmb3IgdGhpcyB0
byBsaXZlIGluIGludGVsX3B2X3N1Ym1pc3Npb24uYyBvcgppbnRlbF92Z3B1X3N1Ym1pc3Npb24u
YwoKPiBAQCAtNDAxLDYgKzU1MSwxMiBAQCB2b2lkIGludGVsX3ZncHVfY29uZmlnX3B2X2NhcHMo
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAo+ICAgICAgICAgICAgICAgICBwcGd0
dC0+dm0uaW5zZXJ0X2VudHJpZXMgPSBnZW44X3BwZ3R0X2luc2VydF80bHZsX3B2Owo+ICAgICAg
ICAgICAgICAgICBwcGd0dC0+dm0uY2xlYXJfcmFuZ2UgPSBnZW44X3BwZ3R0X2NsZWFyXzRsdmxf
cHY7Cj4gICAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKGNhcCA9PSBQVl9TVUJNSVNTSU9OKSB7
Cj4gKyAgICAgICAgICAgICAgIGVuZ2luZSA9IChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICopZGF0
YTsKPiArICAgICAgICAgICAgICAgZW5naW5lLT5zZXRfZGVmYXVsdF9zdWJtaXNzaW9uID0gdmdw
dV9wdl9zZXRfZGVmYXVsdF9zdWJtaXNzaW9uOwo+ICsgICAgICAgICAgICAgICBlbmdpbmUtPnNl
dF9kZWZhdWx0X3N1Ym1pc3Npb24oZW5naW5lKTsKPiArICAgICAgIH0KPiAgfQoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9scmMuYwo+IGluZGV4IGMxYjk3ODAuLjBhNjY3MTQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9scmMuYwo+IEBAIC0yMzUyLDYgKzIzNTIsOSBAQCBsb2dpY2FsX3JpbmdfZGVm
YXVsdF92ZnVuY3Moc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQo+ICAgICAgICAgICAg
ICAgICAgKi8KPiAgICAgICAgIH0KPiAgICAgICAgIGVuZ2luZS0+ZW1pdF9iYl9zdGFydCA9IGdl
bjhfZW1pdF9iYl9zdGFydDsKPiArCj4gKyAgICAgICBpZiAoaW50ZWxfdmdwdV9hY3RpdmUoZW5n
aW5lLT5pOTE1KSkKPiArICAgICAgICAgICAgICAgaW50ZWxfdmdwdV9jb25maWdfcHZfY2Fwcyhl
bmdpbmUtPmk5MTUsIFBWX1NVQk1JU1NJT04sIGVuZ2luZSk7CgpUaGF0IHBhaXIgaXMgdWdseS4g
U2hvdWxkIGNsZWFuIHVwIHRoZSBlbmdpbmUgaW5pdGlhbGlzYXRpb24gc28gdGhhdCBpdApkb2Vz
bid0IGludm9sdmUgcGxhY2luZyBhIGNodW5rIG9mIGNvZGUgaW4gYSBmb3JlaWduIGNsYXNzLgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
