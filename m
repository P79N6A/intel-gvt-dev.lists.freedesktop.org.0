Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2294527ywd;
        Thu, 17 Jan 2019 14:28:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7C2GnU6e4B6vukGBeKqQLSid5U5EVy0dVIGN5lKWg46UhYikF4eLjg3gei/jJpHuGPKCTx
X-Received: by 2002:a62:5ec5:: with SMTP id s188mr16457392pfb.145.1547764085321;
        Thu, 17 Jan 2019 14:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547764085; cv=none;
        d=google.com; s=arc-20160816;
        b=a57jM7l3HaXU9SWZ+7e6pfRs64tjg2vnnLTb1+9De5qiCmiwO+mFY4mMZT+3ohM9I/
         mmgcGS3RevcAeMdQw2QSzI/iGtcoL1OgGs0VyObrEmfCKWvW+xLABZumQ8hLW8eim3Tw
         ZK6xZwOpzm3ILsDI59xX7o4i1wRbC5aTvFBYO1XAH2PyuVtC3p5FMafzf0ydpKqncUoj
         MmLVa32N6Gi2rYtfMf/mCOvz2feSB9ofMJLv/2VpNtK7EBE5Rjcz/6JyIuoCDVhXycCx
         vzhgCKa6IT7dyXtI5vBf8pFI4fx8tBSM5ZvyiJRZkg8/2m2COCUb6eZ+/7Dqnjp9tCpb
         UrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=dFUfZDnz1utTN0jRF5VLw7/NLUiQAKjv3p1Bk8V7ojs=;
        b=HjsDGBBVU6oecEouKpngmqgqoTdleVKy3yCE3no6RB9yTjthLDtH79j2shbUANTDFA
         G602d1BbtqesByDbgs5Lu5OBXL3fEyZLeQinrW2k/6Z1Tgt+YBMfzdiSYbdY2XTNoR2c
         q6c5XafBvLu6Xydgy+nXNkZyYAVuOlFiGqPVE1bHmR3eP7hefspoLhruo2gMr8CGmC6k
         3pVJh3HG1I765qDtzCg6pEwKK7no1exaG81B68vxrlzgSTvA9Q5k9iZvsVluLyWDHUt1
         w0g7/4YShx3ngsgTukGcOPtDZ5H9vOkVCrHtrQnodAS+i4ojooL38BxWN0uB20LFlFJD
         OXFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 10si2938054pfy.206.2019.01.17.14.28.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jan 2019 14:28:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7F76F598;
	Thu, 17 Jan 2019 22:28:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360C6F598
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jan 2019 22:28:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 010A22CD80F;
 Thu, 17 Jan 2019 22:28:03 +0000 (UTC)
Received: from x1.home (ovpn-116-182.phx2.redhat.com [10.3.116.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BCDC16E30;
 Thu, 17 Jan 2019 22:28:01 +0000 (UTC)
Date: Thu, 17 Jan 2019 15:27:49 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/5] vfio/display: add xres + yres properties
Message-ID: <20190117152749.79e4737b@x1.home>
In-Reply-To: <20190111093116.17188-4-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-4-kraxel@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 17 Jan 2019 22:28:04 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxMSBKYW4gMjAxOSAxMDozMToxNCArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgYWxsb3dzIGNvbmZpZ3VyZSB0aGUgZGlzcGxheSBy
ZXNvbHV0aW9uIHdoaWNoIHRoZSB2Z3B1IHNob3VsZCB1c2UuCj4gVGhlIGluZm9ybWF0aW9uIHdp
bGwgYmUgcGFzc2VkIHRvIHRoZSBndWVzdCB1c2luZyBFRElELCBzbyB0aGUgbWRldgo+IGRyaXZl
ciBtdXN0IHN1cHBvcnQgdGhlIHZmaW8gZWRpZCByZWdpb24gZm9yIHRoaXMgdG8gd29yay4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgaHcvdmZpby9wY2kuaCAgICAgfCAgMiArKwo+ICBody92ZmlvL2Rpc3BsYXkuYyB8IDEwICsr
KysrKysrLS0KPiAgaHcvdmZpby9wY2kuYyAgICAgfCAgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L3Zm
aW8vcGNpLmggYi9ody92ZmlvL3BjaS5oCj4gaW5kZXggYjFhZTRjMDc1NC4uYzExYzNmMTY3MCAx
MDA2NDQKPiAtLS0gYS9ody92ZmlvL3BjaS5oCj4gKysrIGIvaHcvdmZpby9wY2kuaAo+IEBAIC0x
NDksNiArMTQ5LDggQEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT1BDSURldmljZSB7Cj4gICNkZWZpbmUg
VkZJT19GRUFUVVJFX0VOQUJMRV9JR0RfT1BSRUdJT04gXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICgxIDw8IFZGSU9fRkVBVFVSRV9FTkFCTEVfSUdEX09QUkVHSU9OX0JJVCkK
PiAgICAgIE9uT2ZmQXV0byBkaXNwbGF5Owo+ICsgICAgdWludDMyX3QgZGlzcGxheV94cmVzOwo+
ICsgICAgdWludDMyX3QgZGlzcGxheV95cmVzOwo+ICAgICAgaW50MzJfdCBib290aW5kZXg7Cj4g
ICAgICB1aW50MzJfdCBpZ2RfZ21zOwo+ICAgICAgT2ZmQXV0b1BDSUJBUiBtc2l4X3JlbG87Cj4g
ZGlmZiAtLWdpdCBhL2h3L3ZmaW8vZGlzcGxheS5jIGIvaHcvdmZpby9kaXNwbGF5LmMKPiBpbmRl
eCAwZWY0ZDc3ZTIxLi4zYTEwMDcyODIzIDEwMDY0NAo+IC0tLSBhL2h3L3ZmaW8vZGlzcGxheS5j
Cj4gKysrIGIvaHcvdmZpby9kaXNwbGF5LmMKPiBAQCAtNDMsOCArNDMsOCBAQCBzdGF0aWMgdm9p
ZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFi
bGVkLCBpbnQgcHJlZgo+ICAgICAgcWVtdV9lZGlkX2luZm8gZWRpZCA9IHsKPiAgICAgICAgICAu
bWF4eCAgPSBkcHktPmVkaWRfcmVncy0+bWF4X3hyZXMsCj4gICAgICAgICAgLm1heHkgID0gZHB5
LT5lZGlkX3JlZ3MtPm1heF95cmVzLAo+IC0gICAgICAgIC5wcmVmeCA9IHByZWZ4LAo+IC0gICAg
ICAgIC5wcmVmeSA9IHByZWZ5LAo+ICsgICAgICAgIC5wcmVmeCA9IHByZWZ4ID86IHZkZXYtPmRp
c3BsYXlfeHJlcywKPiArICAgICAgICAucHJlZnkgPSBwcmVmeSA/OiB2ZGV2LT5kaXNwbGF5X3ly
ZXMsCj4gICAgICB9Owo+ICAKPiAgICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJ
T19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsKPiBAQCAtMTIwLDYgKzEyMCwxMiBAQCBzdGF0
aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KFZGSU9QQ0lEZXZpY2UgKnZkZXYpCj4gICAg
ICBwcmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRp
ZF9yZWdzLCBtYXhfeXJlcyk7Cj4gICAgICBkcHktPmVkaWRfYmxvYiA9IGdfbWFsbG9jMChkcHkt
PmVkaWRfcmVncy0+ZWRpZF9tYXhfc2l6ZSk7Cj4gIAo+ICsgICAgLyogaWYgeHJlcyArIHlyZXMg
cHJvcGVydGllcyBhcmUgdW5zZXQgdXNlIHRoZSBtYXhpbXVtIHJlc29sdXRpb24gKi8KPiArICAg
IGlmICghdmRldi0+ZGlzcGxheV94cmVzKQo+ICsgICAgICAgIHZkZXYtPmRpc3BsYXlfeHJlcyA9
IGRweS0+ZWRpZF9yZWdzLT5tYXhfeHJlczsKPiArICAgIGlmICghdmRldi0+ZGlzcGxheV95cmVz
KQo+ICsgICAgICAgIHZkZXYtPmRpc3BsYXlfeXJlcyA9IGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJl
czsKCkV4Y2Vzc2l2ZSBjdXJseSBicmFjZXMgaGVyZSBhcyB3ZWxsIHBsZWFzZS4KCj4gKwo+ICAg
ICAgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRlKHZkZXYsIHRydWUsIDAsIDApOwo+ICAgICAgcmV0
dXJuOwo+ICAKPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9wY2kuYyBiL2h3L3ZmaW8vcGNpLmMKPiBp
bmRleCBjMGNiMWVjMjg5Li42ZjliNjk5MmZjIDEwMDY0NAo+IC0tLSBhL2h3L3ZmaW8vcGNpLmMK
PiArKysgYi9ody92ZmlvL3BjaS5jCj4gQEAgLTMxODIsNiArMzE4Miw4IEBAIHN0YXRpYyBQcm9w
ZXJ0eSB2ZmlvX3BjaV9kZXZfcHJvcGVydGllc1tdID0gewo+ICAgICAgREVGSU5FX1BST1BfU1RS
SU5HKCJzeXNmc2RldiIsIFZGSU9QQ0lEZXZpY2UsIHZiYXNlZGV2LnN5c2ZzZGV2KSwKPiAgICAg
IERFRklORV9QUk9QX09OX09GRl9BVVRPKCJkaXNwbGF5IiwgVkZJT1BDSURldmljZSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRpc3BsYXksIE9OX09GRl9BVVRPX09GRiksCj4gKyAg
ICBERUZJTkVfUFJPUF9VSU5UMzIoInhyZXMiLCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3hyZXMs
IDApLAo+ICsgICAgREVGSU5FX1BST1BfVUlOVDMyKCJ5cmVzIiwgVkZJT1BDSURldmljZSwgZGlz
cGxheV95cmVzLCAwKSwKCldlJ3JlIGNvbW1pdHRpbmcgdG8gc3VwcG9ydGluZyB0aGlzIHRoZW4g
dnMgdGhlIHgtIHByZWZpeD8gIFNob3VsZG4ndAp0aGVzZSBvcHRpb25zIGdlbmVyYXRlIGFuIGVy
cm9yIGlmIHRoZXJlJ3Mgbm8gZGlzcGxheSBkZXZpY2Ugb3IgdGhlcmUncwpubyBFRElEIHJlZ2lv
biBzdXBwb3J0IHRvIGJhY2sgdGhlIG9wdGlvbj8gIFRoYW5rcywKCkFsZXgKCj4gICAgICBERUZJ
TkVfUFJPUF9VSU5UMzIoIngtaW50eC1tbWFwLXRpbWVvdXQtbXMiLCBWRklPUENJRGV2aWNlLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGludHgubW1hcF90aW1lb3V0LCAxMTAwKSwKPiAgICAg
IERFRklORV9QUk9QX0JJVCgieC12Z2EiLCBWRklPUENJRGV2aWNlLCBmZWF0dXJlcywKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
