Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4917198ywa;
        Wed, 20 Feb 2019 14:39:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYs9lLGGepQyaA1ac/LMbQsJGt8BFeFXZI4Scyegx7oEM7o5doA+8rFjzichEgqRoPqaNtu
X-Received: by 2002:a63:5b1f:: with SMTP id p31mr31082648pgb.56.1550702355752;
        Wed, 20 Feb 2019 14:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702355; cv=none;
        d=google.com; s=arc-20160816;
        b=CtsUDZO9f+qDaQZxiwenFFMlUHwmEEodmcuRUXJIxY5dYUViGjFZ+L8Ke0vj4Jt+ts
         OoEMdq8VRFeXVKkefMNki2w0Jd8BSyH1wFvtp0ObdBA9WgeHQ4fZm9h4JCGyyfI27K01
         WSJ3NGNGBCxh3kbt9gn89aXTXRGSDeqKHc1BUTR7Pcu8q79jBc7ZfiqPa1mbEJTZL7Sh
         e1Os3KYywabYXXxpFKyMo9jmT8SYzoL6vUTRHrF04wtG3XdwVldwsGFB6HZSRBfNeKnh
         717HGQYeb9AQ3If/JygrdTt4/7QNnbUlfpjYCXKutJW3AfwiNGKtM0QvnTYLcQx4+ZE+
         KD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=VFKDsoem3528E+ociXhhZtkmL5EukSLnj3KUXdvoMaA=;
        b=DLgQhZd9Y9H5Y9pj9LR83kOi3UK0XNbvVmTnMNidB3uhCS2+yZV0aQFP/HuQv9IlSU
         LOg3IyIgNUDxhhCfYCREsNA9+t9twvrqMCIuazPGapU8eBIVb7EfdY+yrovuESc5eY0H
         6NuH+g9tjr+kDldS2TlpjrLm6oPub5WTv5ef9tFdhB1DUAIN0XEAva79N7wrFf0RItGC
         PfE0R/0bDUyDJvYeDKNhksNjNq3P5puIdBkLR02FKUdtxLqnD8JVWJODV1BnWOWwlrKB
         f27j5wTA6rJXBfkB1kE70XIYuySD/WJDKb9PjUSZrjcuTrSED3Onh8PbMMO6+13M/N5b
         eJCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x14si10423309plr.259.2019.02.20.14.39.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 14:39:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E84891CC;
	Wed, 20 Feb 2019 22:39:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F512891CC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 22:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 46AC6C057EC3;
 Wed, 20 Feb 2019 22:39:14 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 091D560BE6;
 Wed, 20 Feb 2019 22:39:11 +0000 (UTC)
Date: Wed, 20 Feb 2019 15:39:11 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 3/3] vfio/display: delay link up event
Message-ID: <20190220153911.32c9dcd0@w520.home>
In-Reply-To: <20190220084753.9130-4-kraxel@redhat.com>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-4-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 20 Feb 2019 22:39:14 +0000 (UTC)
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

T24gV2VkLCAyMCBGZWIgMjAxOSAwOTo0Nzo1MyArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEtpY2sgdGhlIGRpc3BsYXkgbGluayB1cCBldmVudCB3aXRo
IGEgMC4xIHNlYyBkZWxheSwKPiBzbyB0aGUgZ3Vlc3QgaGFzIGEgY2hhbmNlIHRvIG5vdGljZSB0
aGUgbGluayBkb3duIGZpcnN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8
ICAxICsKPiAgaHcvdmZpby9kaXNwbGF5LmMgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5o
IGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKPiBpbmRleCA1ZjdmNzA5Yjk1Li5iNjVh
MmYwNTE4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oCj4gKysr
IGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKPiBAQCAtMTUxLDYgKzE1MSw3IEBAIHR5
cGVkZWYgc3RydWN0IFZGSU9EaXNwbGF5IHsKPiAgICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZv
ICplZGlkX2luZm87Cj4gICAgICBzdHJ1Y3QgdmZpb19yZWdpb25fZ2Z4X2VkaWQgKmVkaWRfcmVn
czsKPiAgICAgIHVpbnQ4X3QgKmVkaWRfYmxvYjsKPiArICAgIFFFTVVUaW1lciAqZWRpZF9saW5r
X3RpbWVyOwo+ICAgICAgc3RydWN0IHsKPiAgICAgICAgICBWRklPUmVnaW9uIGJ1ZmZlcjsKPiAg
ICAgICAgICBEaXNwbGF5U3VyZmFjZSAqc3VyZmFjZTsKPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9k
aXNwbGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwo+IGluZGV4IDdiOWI2MDRhNjQuLjM2MTgyM2Iy
M2IgMTAwNjQ0Cj4gLS0tIGEvaHcvdmZpby9kaXNwbGF5LmMKPiArKysgYi9ody92ZmlvL2Rpc3Bs
YXkuYwo+IEBAIC0zOCw2ICszOCwyMSBAQAo+ICAgICAgICAgIGdvdG8gZXJyOwo+ICAKPiAgCj4g
K3N0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2xpbmtfdXAodm9pZCAqb3BhcXVlKQo+ICt7
Cj4gKyAgICBWRklPUENJRGV2aWNlICp2ZGV2ID0gb3BhcXVlOwo+ICsgICAgVkZJT0Rpc3BsYXkg
KmRweSA9IHZkZXYtPmRweTsKPiArICAgIGludCBmZCA9IHZkZXYtPnZiYXNlZGV2LmZkOwo+ICsK
PiArICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktf
U1RBVEVfVVA7Cj4gKyAgICBwd3JpdGVfZmllbGQoZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVk
aWRfcmVncywgbGlua19zdGF0ZSk7Cj4gKyAgICB0cmFjZV92ZmlvX2Rpc3BsYXlfZWRpZF9saW5r
X3VwKCk7Cj4gKyAgICByZXR1cm47Cj4gKwo+ICtlcnI6Cj4gKyAgICB0cmFjZV92ZmlvX2Rpc3Bs
YXlfZWRpZF93cml0ZV9lcnJvcigpOwoKTm8ganVtcHMgdG8gaGVyZS4gIFRoYW5rcywKCkFsZXgK
Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZShWRklPUENJ
RGV2aWNlICp2ZGV2LCBib29sIGVuYWJsZWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgcHJlZngsIGludCBwcmVmeSkKPiAgewo+IEBAIC01MCw2ICs2NSw3IEBA
IHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZShWRklPUENJRGV2aWNlICp2ZGV2
LCBib29sIGVuYWJsZWQsCj4gICAgICAgICAgLnByZWZ5ID0gcHJlZnkgPzogdmRldi0+ZGlzcGxh
eV95cmVzLAo+ICAgICAgfTsKPiAgCj4gKyAgICB0aW1lcl9kZWwoZHB5LT5lZGlkX2xpbmtfdGlt
ZXIpOwo+ICAgICAgZHB5LT5lZGlkX3JlZ3MtPmxpbmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhf
TElOS19TVEFURV9ET1dOOwo+ICAgICAgcHdyaXRlX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywg
ZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUpOwo+ICAgICAgdHJhY2VfdmZpb19kaXNwbGF5X2Vk
aWRfbGlua19kb3duKCk7Cj4gQEAgLTc3LDkgKzkzLDggQEAgc3RhdGljIHZvaWQgdmZpb19kaXNw
bGF5X2VkaWRfdXBkYXRlKFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wgZW5hYmxlZCwKPiAgICAg
ICAgICBnb3RvIGVycjsKPiAgICAgIH0KPiAgCj4gLSAgICBkcHktPmVkaWRfcmVncy0+bGlua19z
dGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX1VQOwo+IC0gICAgcHdyaXRlX2ZpZWxk
KGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUpOwo+IC0gICAg
dHJhY2VfdmZpb19kaXNwbGF5X2VkaWRfbGlua191cCgpOwo+ICsgICAgdGltZXJfbW9kKGRweS0+
ZWRpZF9saW5rX3RpbWVyLAo+ICsgICAgICAgICAgICAgIHFlbXVfY2xvY2tfZ2V0X21zKFFFTVVf
Q0xPQ0tfUkVBTFRJTUUpICsgMTAwKTsKPiAgICAgIHJldHVybjsKPiAgCj4gIGVycjoKPiBAQCAt
MTQwLDYgKzE1NSw5IEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BD
SURldmljZSAqdmRldikKPiAgICAgICAgICB2ZGV2LT5kaXNwbGF5X3lyZXMgPSBkcHktPmVkaWRf
cmVncy0+bWF4X3lyZXM7Cj4gICAgICB9Cj4gIAo+ICsgICAgZHB5LT5lZGlkX2xpbmtfdGltZXIg
PSB0aW1lcl9uZXdfbXMoUUVNVV9DTE9DS19SRUFMVElNRSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZmaW9fZGlzcGxheV9lZGlkX2xpbmtfdXAsIHZkZXYpOwo+
ICsKPiAgICAgIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZSh2ZGV2LCB0cnVlLCAwLCAwKTsKPiAg
ICAgIHJldHVybjsKPiAgCj4gQEAgLTE1OCw2ICsxNzYsOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rp
c3BsYXlfZWRpZF9leGl0KFZGSU9EaXNwbGF5ICpkcHkpCj4gIAo+ICAgICAgZ19mcmVlKGRweS0+
ZWRpZF9yZWdzKTsKPiAgICAgIGdfZnJlZShkcHktPmVkaWRfYmxvYik7Cj4gKyAgICB0aW1lcl9k
ZWwoZHB5LT5lZGlkX2xpbmtfdGltZXIpOwo+ICsgICAgdGltZXJfZnJlZShkcHktPmVkaWRfbGlu
a190aW1lcik7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV91cGRhdGVfY3Vy
c29yKFZGSU9ETUFCdWYgKmRtYWJ1ZiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
