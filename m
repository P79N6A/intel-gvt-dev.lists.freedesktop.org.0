Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2294473ywd;
        Thu, 17 Jan 2019 14:28:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4ACZrxhOkuhuxPHUeca2LIEZgDRPaWBcbPi8fPGIkgM3Zid4Iz2pZpU1s4PpgaCkoFKQPP
X-Received: by 2002:a17:902:32c3:: with SMTP id z61mr16704561plb.114.1547764080570;
        Thu, 17 Jan 2019 14:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547764080; cv=none;
        d=google.com; s=arc-20160816;
        b=q7Ydxxt276kkGctuVy1rEndpqppWdupZAYEcOhGcjesseSwiGNyRxQLAaCyMDBXN2P
         r80rcGjasGWbBUcxbe+SIpajvSD3koQghNqTq12V5JWBn58/gUuOQHVQiOD8M20OQZKe
         omisfNY/0rU7EX7KohCcWuUjTe3WtIYoL2w4YR05KnaJqX8+itIpUu8cUc7O2DU/xrDm
         mZy1IWeXQYgQ7gqUHPSmKintKF7Rnu8s0vk+INodXcESasLiw/kwduVSl5lxipLrvpE+
         w3JGJ8INpseu7cPGZ7d4idha+WHOdbJi9dIfiLWyPn8PgfSgJN3TufLOf4AfI5WtgNeR
         eyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=wsX4uYQpZZJlO0QSHc+P6ldyYHFBwuDD6S5F+vHAfZk=;
        b=hCFe1e42xNqQGILvVkEq7SweG7rK+IH0hZAgz/d1L74ZHe1rkij6A5ozTqoIZbZtIB
         ljNEdS65A/w3KOhCChvKWoV1GtQT46BoFX+QUOKu35dueEa5WAWJf2BZPaf1i644Xl04
         QD0UMjsEmh4t7Y4IqkCRjcTRSsukotQGK9dNr1pwzYfgHX+3eoTGTt6TAbWkJoLDWpVB
         h1dpnouYz6E8IulheU8wWyzmZQCUPlIZofRp6eFyQf8aqmpy/irEStm/ovHgU8t6KEgi
         onkgqM5ieWpLQRaHmg3vWRr0LYqDM3N4XIlEqL+2aJFbiNtjYCmqEHDMMLKsyQNFMXyJ
         gP+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id cd16si1747595plb.47.2019.01.17.14.28.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jan 2019 14:28:00 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9276E473;
	Thu, 17 Jan 2019 22:28:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2406E473
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jan 2019 22:27:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACBCC2D4B7B;
 Thu, 17 Jan 2019 22:27:58 +0000 (UTC)
Received: from x1.home (ovpn-116-182.phx2.redhat.com [10.3.116.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5543B194AA;
 Thu, 17 Jan 2019 22:27:57 +0000 (UTC)
Date: Thu, 17 Jan 2019 15:27:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/5] vfio/display: delay link up event
Message-ID: <20190117152756.57c64aee@x1.home>
In-Reply-To: <20190111093116.17188-5-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-5-kraxel@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 17 Jan 2019 22:27:58 +0000 (UTC)
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

T24gRnJpLCAxMSBKYW4gMjAxOSAxMDozMToxNSArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEtpY2sgdGhlIGRpc3BsYXkgbGluayB1cCBldmVudCB3aXRo
IGEgMC4xIHNlYyBkZWxheSwKPiBzbyB0aGUgZ3Vlc3QgaGFzIGEgY2hhbmNlIHRvIG5vdGljZSB0
aGUgbGluayBkb3duIGZpcnN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8
ICAxICsKPiAgaHcvdmZpby9kaXNwbGF5LmMgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysr
KysrKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggYi9p
bmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAo+IGluZGV4IGZmNWM0MjUwNDguLjllMjlkNTgx
MGUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKPiArKysgYi9p
bmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAo+IEBAIC0xNTEsNiArMTUxLDcgQEAgdHlwZWRl
ZiBzdHJ1Y3QgVkZJT0Rpc3BsYXkgewo+ICAgICAgc3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKmVk
aWRfaW5mbzsKPiAgICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCAqZWRpZF9yZWdzOwo+
ICAgICAgdWludDhfdCAqZWRpZF9ibG9iOwo+ICsgICAgUUVNVVRpbWVyICplZGlkX2xpbmtfdGlt
ZXI7Cj4gICAgICBzdHJ1Y3Qgewo+ICAgICAgICAgIFZGSU9SZWdpb24gYnVmZmVyOwo+ICAgICAg
ICAgIERpc3BsYXlTdXJmYWNlICpzdXJmYWNlOwo+IGRpZmYgLS1naXQgYS9ody92ZmlvL2Rpc3Bs
YXkuYyBiL2h3L3ZmaW8vZGlzcGxheS5jCj4gaW5kZXggM2ExMDA3MjgyMy4uYTNhNzEwYjNlZSAx
MDA2NDQKPiAtLS0gYS9ody92ZmlvL2Rpc3BsYXkuYwo+ICsrKyBiL2h3L3ZmaW8vZGlzcGxheS5j
Cj4gQEAgLTM3LDYgKzM3LDE5IEBACj4gICAgICAgICAgZ290byBlcnI7Cj4gIAo+ICAKPiArc3Rh
dGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfbGlua191cCh2b2lkICpvcGFxdWUpCj4gK3sKPiAr
ICAgIFZGSU9QQ0lEZXZpY2UgKnZkZXYgPSBvcGFxdWU7Cj4gKyAgICBWRklPRGlzcGxheSAqZHB5
ID0gdmRldi0+ZHB5Owo+ICsKPiArICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJ
T19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfVVA7Cj4gKyAgICBwd3JpdGVfZmllbGQodmRldi0+dmJh
c2VkZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSk7Cj4g
KyAgICByZXR1cm47Cj4gKwo+ICtlcnI6Cj4gKyAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBPb3Bz
LCBwd3JpdGUgZXJyb3JcbiIsIF9fZnVuY19fKTsKClRyYWNpbmcgYW4gZXJyb3JfcmVwb3J0IGFn
YWluLCBhbmQgcGF0Y2hldyBmb3VuZCBhIGxvbmcgbGluZSBzb21ld2hlcmUKYmVsb3cuICBUaGFu
a3MsCgpBbGV4Cgo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRh
dGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZngsIGludCBwcmVm
eSkKPiAgewo+ICAgICAgVkZJT0Rpc3BsYXkgKmRweSA9IHZkZXYtPmRweTsKPiBAQCAtNDcsNiAr
NjAsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmlj
ZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgo+ICAgICAgICAgIC5wcmVmeSA9IHByZWZ5
ID86IHZkZXYtPmRpc3BsYXlfeXJlcywKPiAgICAgIH07Cj4gIAo+ICsgICAgdGltZXJfZGVsKGRw
eS0+ZWRpZF9saW5rX3RpbWVyKTsKPiAgICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0g
VkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsKPiAgICAgIHB3cml0ZV9maWVsZCh2ZGV2
LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRl
KTsKPiAgCj4gQEAgLTcyLDggKzg2LDcgQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRf
dXBkYXRlKFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wgZW5hYmxlZCwgaW50IHByZWYKPiAgICAg
ICAgICBnb3RvIGVycjsKPiAgICAgIH0KPiAgCj4gLSAgICBkcHktPmVkaWRfcmVncy0+bGlua19z
dGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX1VQOwo+IC0gICAgcHdyaXRlX2ZpZWxk
KHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtf
c3RhdGUpOwo+ICsgICAgdGltZXJfbW9kKGRweS0+ZWRpZF9saW5rX3RpbWVyLCBxZW11X2Nsb2Nr
X2dldF9tcyhRRU1VX0NMT0NLX1JFQUxUSU1FKSArIDEwMCk7Cj4gICAgICByZXR1cm47Cj4gIAo+
ICBlcnI6Cj4gQEAgLTEyNiw2ICsxMzksOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRp
ZF9pbml0KFZGSU9QQ0lEZXZpY2UgKnZkZXYpCj4gICAgICBpZiAoIXZkZXYtPmRpc3BsYXlfeXJl
cykKPiAgICAgICAgICB2ZGV2LT5kaXNwbGF5X3lyZXMgPSBkcHktPmVkaWRfcmVncy0+bWF4X3ly
ZXM7Cj4gIAo+ICsgICAgZHB5LT5lZGlkX2xpbmtfdGltZXIgPSB0aW1lcl9uZXdfbXMoUUVNVV9D
TE9DS19SRUFMVElNRSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZmaW9fZGlzcGxheV9lZGlkX2xpbmtfdXAsIHZkZXYpOwo+ICsKPiAgICAgIHZmaW9fZGlzcGxh
eV9lZGlkX3VwZGF0ZSh2ZGV2LCB0cnVlLCAwLCAwKTsKPiAgICAgIHJldHVybjsKPiAgCj4gQEAg
LTE0Myw2ICsxNTksOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9leGl0KFZGSU9E
aXNwbGF5ICpkcHkpCj4gIAo+ICAgICAgZ19mcmVlKGRweS0+ZWRpZF9yZWdzKTsKPiAgICAgIGdf
ZnJlZShkcHktPmVkaWRfYmxvYik7Cj4gKyAgICB0aW1lcl9kZWwoZHB5LT5lZGlkX2xpbmtfdGlt
ZXIpOwo+ICsgICAgdGltZXJfZnJlZShkcHktPmVkaWRfbGlua190aW1lcik7Cj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV91cGRhdGVfY3Vyc29yKFZGSU9ETUFCdWYgKmRtYWJ1
ZiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldgo=
