Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2294430ywd;
        Thu, 17 Jan 2019 14:27:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN69YXOdslPBcEFUvKquhK7Ei9he6u8juTtha2XGQOlA1mqz5ws8qlwU+FoLAeINY6SQvSmV
X-Received: by 2002:a17:902:e18c:: with SMTP id cd12mr15920038plb.279.1547764078144;
        Thu, 17 Jan 2019 14:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547764078; cv=none;
        d=google.com; s=arc-20160816;
        b=z0MMIve0kO/WoYvAxkzTwfljsczRC5+gYSYWfQMoqvTlYDFVxOLqo33LmDCZ+4qo66
         5Ucm8Ntnm0qMiVPlbspx1l5CCc8StQcQjh9Ai3SIKiGV2EDGAKz36Q6c6i8m8I2fDhp5
         5CTEmZ42Odj/ArgfmqLRowU58PbQA/Qvz4asjEothNrOtcKcfcMATnKhJdigjLKsQUeN
         hJAmK7idKoMw+uvGGn4cDXFlQRcTPnhiELuFqa25FcAxeBrH4Ex4UH92w4nmuJGg+bAD
         DVBEYVsuIYRbhZF+Th9XiIofzi6Ufzpq8LrGc3s8jWWKx8TYt8Ww2dji9yHH00PAqOjt
         yjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=Y+pFWIE73ks/D3g2poipO/hU4vwDpyq4AC/zikGf624=;
        b=EyGjSmfoKsofS08oZZwNOnTjE6sSaZepA+BwIiYx59Jzkb0Mlq1ao6wNk0gaEyB0wB
         SiOk3zZargpbnNtrz4e8dRLFfsWP/zZs8d893CRwuN7vtrlSvVfDp70zlFPbWAfF8OKs
         tfBVhu0o5x8H/z0K/uYzNDoCA/KfR8iUqsoG/xWsz1R58T9DWPLisw+Gpqb7zrzM9ZFH
         6VJnVYCzzFTuXON1GXhSt4bPyWhN54/kSabhu+P4nGHouWBcR6UFxeC9hIhGTbNnEjY6
         Ld3Yre4k9RpLqTTdA2PtrDYqbLWJ7+LTU5Wl63pElFOU8+rDwCVIsPRNMlp0MXXi+OVH
         KhCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id x128si2911037pfb.128.2019.01.17.14.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jan 2019 14:27:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBF96E0B4;
	Thu, 17 Jan 2019 22:27:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76336E0B4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jan 2019 22:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2829142BD8;
 Thu, 17 Jan 2019 22:27:55 +0000 (UTC)
Received: from x1.home (ovpn-116-182.phx2.redhat.com [10.3.116.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F3FA61B89;
 Thu, 17 Jan 2019 22:27:48 +0000 (UTC)
Date: Thu, 17 Jan 2019 15:27:48 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/5] vfio/display: add edid support.
Message-ID: <20190117152748.258b0db5@x1.home>
In-Reply-To: <20190111093116.17188-3-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-3-kraxel@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 17 Jan 2019 22:27:55 +0000 (UTC)
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

T24gRnJpLCAxMSBKYW4gMjAxOSAxMDozMToxMyArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggYWRkcyBFRElEIHN1cHBvcnQgdG8gdGhl
IHZmaW8gZGlzcGxheSAoYWthIHZncHUpIGNvZGUuCj4gV2hlbiBzdXBwb3J0ZWQgYnkgdGhlIG1k
ZXYgZHJpdmVyIHFlbXUgd2lsbCBnZW5lcmF0ZSBhIEVESUQgYmxvYgo+IGFuZCBwYXNzIGl0IG9u
IHVzaW5nIHRoZSBuZXcgdmZpbyBlZGlkIHJlZ2lvbi4gIFRoZSBFRElEIGJsb2Igd2lsbAo+IGJl
IHVwZGF0ZWQgb24gVUkgY2hhbmdlcyAoaS5lLiB3aW5kb3cgcmVzaXplKSwgc28gdGhlIGd1ZXN0
IGNhbgo+IGFkYXB0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8ICAgMyAr
Kwo+ICBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAgICAgICB8IDExOCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCBi
L2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oCj4gaW5kZXggMWI0MzRkMDJmNi4uZmY1YzQy
NTA0OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAo+ICsrKyBi
L2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oCj4gQEAgLTE0OCw2ICsxNDgsOSBAQCB0eXBl
ZGVmIHN0cnVjdCBWRklPRE1BQnVmIHsKPiAgdHlwZWRlZiBzdHJ1Y3QgVkZJT0Rpc3BsYXkgewo+
ICAgICAgUWVtdUNvbnNvbGUgKmNvbjsKPiAgICAgIFJBTUZCU3RhdGUgKnJhbWZiOwo+ICsgICAg
c3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKmVkaWRfaW5mbzsKPiArICAgIHN0cnVjdCB2ZmlvX3Jl
Z2lvbl9nZnhfZWRpZCAqZWRpZF9yZWdzOwo+ICsgICAgdWludDhfdCAqZWRpZF9ibG9iOwo+ICAg
ICAgc3RydWN0IHsKPiAgICAgICAgICBWRklPUmVnaW9uIGJ1ZmZlcjsKPiAgICAgICAgICBEaXNw
bGF5U3VyZmFjZSAqc3VyZmFjZTsKPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9kaXNwbGF5LmMgYi9o
dy92ZmlvL2Rpc3BsYXkuYwo+IGluZGV4IGRlYWQzMGU2MjYuLjBlZjRkNzdlMjEgMTAwNjQ0Cj4g
LS0tIGEvaHcvdmZpby9kaXNwbGF5LmMKPiArKysgYi9ody92ZmlvL2Rpc3BsYXkuYwo+IEBAIC0x
NSw2ICsxNSw3IEBACj4gICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KPiAgCj4gICNpbmNsdWRlICJz
eXNlbXUvc3lzZW11LmgiCj4gKyNpbmNsdWRlICJody9kaXNwbGF5L2VkaWQuaCIKPiAgI2luY2x1
ZGUgInVpL2NvbnNvbGUuaCIKPiAgI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIKPiAgI2luY2x1ZGUg
InBjaS5oIgo+IEBAIC0yNCw2ICsyNSwxMjAgQEAKPiAgIyBkZWZpbmUgRFJNX1BMQU5FX1RZUEVf
Q1VSU09SICAyCj4gICNlbmRpZgo+ICAKPiArI2RlZmluZSBwcmVhZF9maWVsZChfZmQsIF9yZWcs
IF9wdHIsIF9mbGQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgaWYgKHNp
emVvZihfcHRyLT5fZmxkKSAhPSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICAgICAgcHJlYWQoX2ZkLCAmKF9wdHItPl9mbGQpLCBzaXplb2YoX3B0ci0+
X2ZsZCksICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICBfcmVnLT5vZmZzZXQg
KyBvZmZzZXRvZih0eXBlb2YoKl9wdHIpLCBfZmxkKSkpICAgICAgICAgICAgXAo+ICsgICAgICAg
IGdvdG8gZXJyOwo+ICsjZGVmaW5lIHB3cml0ZV9maWVsZChfZmQsIF9yZWcsIF9wdHIsIF9mbGQp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBpZiAoc2l6ZW9mKF9wdHItPl9m
bGQpICE9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICBwd3JpdGUoX2ZkLCAmKF9wdHItPl9mbGQpLCBzaXplb2YoX3B0ci0+X2ZsZCksICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBfcmVnLT5vZmZzZXQgKyBvZmZzZXRvZih0
eXBlb2YoKl9wdHIpLCBfZmxkKSkpICAgICAgICAgICBcCj4gKyAgICAgICAgZ290byBlcnI7Cj4g
Kwo+ICsKPiArc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRlKFZGSU9QQ0lEZXZp
Y2UgKnZkZXYsIGJvb2wgZW5hYmxlZCwgaW50IHByZWZ4LCBpbnQgcHJlZnkpCgpQYXRjaGV3IG5v
dGVkIHRoaXMgbGluZSB0b28gbG9uZywgcGxlYXNlIHdyYXAuCgo+ICt7Cj4gKyAgICBWRklPRGlz
cGxheSAqZHB5ID0gdmRldi0+ZHB5Owo+ICsgICAgcWVtdV9lZGlkX2luZm8gZWRpZCA9IHsKPiAr
ICAgICAgICAubWF4eCAgPSBkcHktPmVkaWRfcmVncy0+bWF4X3hyZXMsCj4gKyAgICAgICAgLm1h
eHkgID0gZHB5LT5lZGlkX3JlZ3MtPm1heF95cmVzLAo+ICsgICAgICAgIC5wcmVmeCA9IHByZWZ4
LAo+ICsgICAgICAgIC5wcmVmeSA9IHByZWZ5LAo+ICsgICAgfTsKPiArCj4gKyAgICBkcHktPmVk
aWRfcmVncy0+bGlua19zdGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX0RPV047Cj4g
KyAgICBwd3JpdGVfZmllbGQodmRldi0+dmJhc2VkZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHkt
PmVkaWRfcmVncywgbGlua19zdGF0ZSk7Cj4gKwo+ICsgICAgaWYgKCFlbmFibGVkKSB7Cj4gKyAg
ICAgICAgcmV0dXJuOwo+ICsgICAgfQo+ICsKPiArICAgIGlmIChlZGlkLm1heHggJiYgZWRpZC5w
cmVmeCA+IGVkaWQubWF4eCkgewo+ICsgICAgICAgIGVkaWQucHJlZnggPSBlZGlkLm1heHg7Cj4g
KyAgICB9Cj4gKyAgICBpZiAoZWRpZC5tYXh5ICYmIGVkaWQucHJlZnkgPiBlZGlkLm1heHkpIHsK
PiArICAgICAgICBlZGlkLnByZWZ5ID0gZWRpZC5tYXh5Owo+ICsgICAgfQo+ICsgICAgcWVtdV9l
ZGlkX2dlbmVyYXRlKGRweS0+ZWRpZF9ibG9iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRw
eS0+ZWRpZF9yZWdzLT5lZGlkX21heF9zaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICZl
ZGlkKTsKPiArCj4gKyAgICBkcHktPmVkaWRfcmVncy0+ZWRpZF9zaXplID0gcWVtdV9lZGlkX3Np
emUoZHB5LT5lZGlkX2Jsb2IpOwo+ICsgICAgcHdyaXRlX2ZpZWxkKHZkZXYtPnZiYXNlZGV2LmZk
LCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGVkaWRfc2l6ZSk7Cj4gKyAgICBpZiAo
cHdyaXRlKHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfYmxvYiwgZHB5LT5lZGlkX3JlZ3Mt
PmVkaWRfc2l6ZSwKPiArICAgICAgICAgICAgICAgZHB5LT5lZGlkX2luZm8tPm9mZnNldCArIGRw
eS0+ZWRpZF9yZWdzLT5lZGlkX29mZnNldCkKPiArICAgICAgICAhPSBkcHktPmVkaWRfcmVncy0+
ZWRpZF9zaXplKSB7Cj4gKyAgICAgICAgZ290byBlcnI7Cj4gKyAgICB9Cj4gKwo+ICsgICAgZHB5
LT5lZGlkX3JlZ3MtPmxpbmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9VUDsK
PiArICAgIHB3cml0ZV9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRw
eS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRlKTsKPiArICAgIHJldHVybjsKPiArCj4gK2VycjoKPiAr
ICAgIGZwcmludGYoc3RkZXJyLCAiJXM6IE9vcHMsIHB3cml0ZSBlcnJvclxuIiwgX19mdW5jX18p
OwoKVGhlc2UgYXJlIG5vdCB0aGUgbW9zdCBoZWxwZnVsIGVycm9yIG1lc3NhZ2VzIGFuZCBvdWdo
dCB0byBiZSBhdCBsZWFzdAp1c2luZyBlcnJvcl9yZXBvcnQoKSByYXRoZXIgdGhhbiBkdW1waW5n
IGRpcmVjdGx5IHRvIHN0ZGVyci4gIEhvdyBhYm91dApzb21lIHRyYWNpbmcgc3VwcG9ydCB0b28/
ICBUcmFjaW5nIGZlYXR1cmUgaW5pdCBhbmQgbGluay9yZXNvbHV0aW9uCnN0YXRlIGNoYW5nZXMg
Y291bGQgYmUgdXNlZnVsLgoKPiArICAgIHJldHVybjsKPiArfQo+ICsKPiArc3RhdGljIGludCB2
ZmlvX2Rpc3BsYXlfZWRpZF91aV9pbmZvKHZvaWQgKm9wYXF1ZSwgdWludDMyX3QgaWR4LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUWVtdVVJSW5mbyAqaW5mbykKPiAr
ewo+ICsgICAgVkZJT1BDSURldmljZSAqdmRldiA9IG9wYXF1ZTsKPiArICAgIFZGSU9EaXNwbGF5
ICpkcHkgPSB2ZGV2LT5kcHk7Cj4gKwo+ICsgICAgaWYgKCFkcHktPmVkaWRfcmVncykgewo+ICsg
ICAgICAgIHJldHVybiAwOwo+ICsgICAgfQo+ICsKPiArICAgIGlmIChpbmZvLT53aWR0aCAmJiBp
bmZvLT5oZWlnaHQpIHsKPiArICAgICAgICB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUodmRldiwg
dHJ1ZSwgaW5mby0+d2lkdGgsIGluZm8tPmhlaWdodCk7Cj4gKyAgICB9IGVsc2Ugewo+ICsgICAg
ICAgIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZSh2ZGV2LCBmYWxzZSwgMCwgMCk7Cj4gKyAgICB9
Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHZmaW9fZGlzcGxh
eV9lZGlkX2luaXQoVkZJT1BDSURldmljZSAqdmRldikKPiArewo+ICsgICAgVkZJT0Rpc3BsYXkg
KmRweSA9IHZkZXYtPmRweTsKPiArICAgIGludCByZXQ7Cj4gKwo+ICsgICAgcmV0ID0gdmZpb19n
ZXRfZGV2X3JlZ2lvbl9pbmZvKCZ2ZGV2LT52YmFzZWRldiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBWRklPX1JFR0lPTl9UWVBFX0dGWCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBWRklPX1JFR0lPTl9TVUJUWVBFX0dGWF9FRElELAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkcHktPmVkaWRfaW5mbyk7Cj4gKyAgICBp
ZiAocmV0KSB7Cj4gKyAgICAgICAgcmV0dXJuOwo+ICsgICAgfQo+ICsKPiArICAgIGRweS0+ZWRp
ZF9yZWdzID0gZ19uZXcwKHN0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCwgMSk7Cj4gKyAgICBw
cmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9y
ZWdzLCBlZGlkX29mZnNldCk7Cj4gKyAgICBwcmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwg
ZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBlZGlkX21heF9zaXplKTsKClBhdGNoZXcg
ZGlkbid0IGxpa2UgdGhpcyBsb25nIGxpbmUgZWl0aGVyLgoKPiArICAgIHByZWFkX2ZpZWxkKHZk
ZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIG1heF94cmVz
KTsKPiArICAgIHByZWFkX2ZpZWxkKHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywg
ZHB5LT5lZGlkX3JlZ3MsIG1heF95cmVzKTsKPiArICAgIGRweS0+ZWRpZF9ibG9iID0gZ19tYWxs
b2MwKGRweS0+ZWRpZF9yZWdzLT5lZGlkX21heF9zaXplKTsKPiArCj4gKyAgICB2ZmlvX2Rpc3Bs
YXlfZWRpZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwgMCk7Cj4gKyAgICByZXR1cm47Cj4gKwo+ICtl
cnI6Cj4gKyAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBPb3BzLCBwcmVhZCBlcnJvclxuIiwgX19m
dW5jX18pOwo+ICsgICAgZ19mcmVlKGRweS0+ZWRpZF9yZWdzKTsKPiArICAgIGRweS0+ZWRpZF9y
ZWdzID0gTlVMTDsKPiArICAgIHJldHVybjsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgdmZpb19k
aXNwbGF5X2VkaWRfZXhpdChWRklPRGlzcGxheSAqZHB5KQo+ICt7Cj4gKyAgICBpZiAoIWRweS0+
ZWRpZF9yZWdzKQo+ICsgICAgICAgIHJldHVybjsKCkV4Y2Vzc2l2ZSBjdXJseSBicmFjZXMgYXMg
ZGVtYW5kZWQgYnkgb3VyIHN0eWxlIGd1aWRlIHBsZWFzZSA7KQoKVGhhbmtzLApBbGV4Cgo+ICsK
PiArICAgIGdfZnJlZShkcHktPmVkaWRfcmVncyk7Cj4gKyAgICBnX2ZyZWUoZHB5LT5lZGlkX2Js
b2IpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfdXBkYXRlX2N1cnNvcihW
RklPRE1BQnVmICpkbWFidWYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2ZmlvX2RldmljZV9nZnhfcGxhbmVfaW5mbyAqcGxhbmUpCj4gIHsKPiBAQCAt
MTcxLDYgKzI4Niw3IEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9kbWFidWZfdXBkYXRlKHZv
aWQgKm9wYXF1ZSkKPiAgCj4gIHN0YXRpYyBjb25zdCBHcmFwaGljSHdPcHMgdmZpb19kaXNwbGF5
X2RtYWJ1Zl9vcHMgPSB7Cj4gICAgICAuZ2Z4X3VwZGF0ZSA9IHZmaW9fZGlzcGxheV9kbWFidWZf
dXBkYXRlLAo+ICsgICAgLnVpX2luZm8gICAgPSB2ZmlvX2Rpc3BsYXlfZWRpZF91aV9pbmZvLAo+
ICB9Owo+ICAKPiAgc3RhdGljIGludCB2ZmlvX2Rpc3BsYXlfZG1hYnVmX2luaXQoVkZJT1BDSURl
dmljZSAqdmRldiwgRXJyb3IgKiplcnJwKQo+IEBAIC0xODcsNiArMzAzLDcgQEAgc3RhdGljIGlu
dCB2ZmlvX2Rpc3BsYXlfZG1hYnVmX2luaXQoVkZJT1BDSURldmljZSAqdmRldiwgRXJyb3IgKipl
cnJwKQo+ICAgICAgaWYgKHZkZXYtPmVuYWJsZV9yYW1mYikgewo+ICAgICAgICAgIHZkZXYtPmRw
eS0+cmFtZmIgPSByYW1mYl9zZXR1cChlcnJwKTsKPiAgICAgIH0KPiArICAgIHZmaW9fZGlzcGxh
eV9lZGlkX2luaXQodmRldik7Cj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAtMzY2LDUg
KzQ4Myw2IEBAIHZvaWQgdmZpb19kaXNwbGF5X2ZpbmFsaXplKFZGSU9QQ0lEZXZpY2UgKnZkZXYp
Cj4gICAgICBncmFwaGljX2NvbnNvbGVfY2xvc2UodmRldi0+ZHB5LT5jb24pOwo+ICAgICAgdmZp
b19kaXNwbGF5X2RtYWJ1Zl9leGl0KHZkZXYtPmRweSk7Cj4gICAgICB2ZmlvX2Rpc3BsYXlfcmVn
aW9uX2V4aXQodmRldi0+ZHB5KTsKPiArICAgIHZmaW9fZGlzcGxheV9lZGlkX2V4aXQodmRldi0+
ZHB5KTsKPiAgICAgIGdfZnJlZSh2ZGV2LT5kcHkpOwo+ICB9CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
