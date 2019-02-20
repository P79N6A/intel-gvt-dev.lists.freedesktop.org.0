Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4915179ywa;
        Wed, 20 Feb 2019 14:36:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYSgwG/Xbm/U9C3dDcfHseVTZkugn37R9CDb3s7ZD1XnxmNWWwg1i4g1E6/BjTBQd6o9Y1O
X-Received: by 2002:a17:902:1a2:: with SMTP id b31mr39531056plb.87.1550702170795;
        Wed, 20 Feb 2019 14:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702170; cv=none;
        d=google.com; s=arc-20160816;
        b=JdiIPVsUexMfhgL6dEZAVm3sT83MDrk8TgWshQynq846jfGaBz6q8N9PESEziVLWGR
         g0vesUusyMGaDhHrmB35w8WKZ9CeV1x8ZpfZ5ocN0rT2bhWyLAW4vme22PphzV/jIShi
         yUT6mIZVitL6pU7v7k9tCUBpUtH/1X+vXzoYZrEw3OxOr7TqjRRIe0VnAZZqNRqA/pF9
         SHp6Acwu4d7PD55m3BdKXHxiGcp1gBnm+FhqRsbOsGPyn8RuipajPxbvDvptTrBNsgPQ
         iDmxLXAQvIMacIMu/QqA4NyzsE2BvYL1GIJoxxJmqzZ969PokPWoMj8Tx+3sWt6NSSKB
         Npkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=6X7WPp7f2axSIq665zW1XWEo65lEW73i9sDERW9QewY=;
        b=QUxIZFCMmSyUw+DNONQcDXdZweUmBsgYJyCwJDcrWUc1+zEJyQQpx4GLwuSQbdvb/S
         L/mPv4W1q914TIFkVzyNxyF9njky6cMf29IsegfDeOAY2JXjKpIAFd7Vb2kqJeC7owWQ
         ryyk28y3MPYY4+io3UnigAF5BaFJFWmZYhSx/NBajZtClOAdIhB0ZCGop38eLycOg/bv
         F5iQouNUMrFUSM8IQTIrWDNt6ie4vssOwfQuGCRty4xQf6xmhS/Znkd5c61/EcxUbYQ7
         65Z6IzDmnE7X8jl7PIMPnMEYVuHGklW47vHGz0GexImWItTGJlnkVwu6GKucSxP1v97k
         RJCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id s14si13113694plq.284.2019.02.20.14.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 14:36:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77E6891F4;
	Wed, 20 Feb 2019 22:36:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD80891F4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 22:36:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 476115AFE8;
 Wed, 20 Feb 2019 22:36:08 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 531EB5C298;
 Wed, 20 Feb 2019 22:36:03 +0000 (UTC)
Date: Wed, 20 Feb 2019 15:36:02 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/3] vfio/display: add xres + yres properties
Message-ID: <20190220153602.57a11e97@w520.home>
In-Reply-To: <20190220084753.9130-3-kraxel@redhat.com>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-3-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 20 Feb 2019 22:36:08 +0000 (UTC)
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

T24gV2VkLCAyMCBGZWIgMjAxOSAwOTo0Nzo1MiArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgYWxsb3dzIGNvbmZpZ3VyZSB0aGUgZGlzcGxheSBy
ZXNvbHV0aW9uIHdoaWNoIHRoZSB2Z3B1IHNob3VsZCB1c2UuCj4gVGhlIGluZm9ybWF0aW9uIHdp
bGwgYmUgcGFzc2VkIHRvIHRoZSBndWVzdCB1c2luZyBFRElELCBzbyB0aGUgbWRldgo+IGRyaXZl
ciBtdXN0IHN1cHBvcnQgdGhlIHZmaW8gZWRpZCByZWdpb24gZm9yIHRoaXMgdG8gd29yay4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgaHcvdmZpby9wY2kuaCAgICAgfCAgMiArKwo+ICBody92ZmlvL2Rpc3BsYXkuYyB8IDE2ICsr
KysrKysrKysrKysrLS0KPiAgaHcvdmZpby9wY2kuYyAgICAgfCAgMiArKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2h3L3ZmaW8vcGNpLmggYi9ody92ZmlvL3BjaS5oCj4gaW5kZXggYjFhZTRjMDc1NC4uYzExYzNm
MTY3MCAxMDA2NDQKPiAtLS0gYS9ody92ZmlvL3BjaS5oCj4gKysrIGIvaHcvdmZpby9wY2kuaAo+
IEBAIC0xNDksNiArMTQ5LDggQEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT1BDSURldmljZSB7Cj4gICNk
ZWZpbmUgVkZJT19GRUFUVVJFX0VOQUJMRV9JR0RfT1BSRUdJT04gXAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICgxIDw8IFZGSU9fRkVBVFVSRV9FTkFCTEVfSUdEX09QUkVHSU9O
X0JJVCkKPiAgICAgIE9uT2ZmQXV0byBkaXNwbGF5Owo+ICsgICAgdWludDMyX3QgZGlzcGxheV94
cmVzOwo+ICsgICAgdWludDMyX3QgZGlzcGxheV95cmVzOwo+ICAgICAgaW50MzJfdCBib290aW5k
ZXg7Cj4gICAgICB1aW50MzJfdCBpZ2RfZ21zOwo+ICAgICAgT2ZmQXV0b1BDSUJBUiBtc2l4X3Jl
bG87Cj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vZGlzcGxheS5jIGIvaHcvdmZpby9kaXNwbGF5LmMK
PiBpbmRleCBlZDJlYjE5ZWEzLi43YjliNjA0YTY0IDEwMDY0NAo+IC0tLSBhL2h3L3ZmaW8vZGlz
cGxheS5jCj4gKysrIGIvaHcvdmZpby9kaXNwbGF5LmMKPiBAQCAtNDYsOCArNDYsOCBAQCBzdGF0
aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9v
bCBlbmFibGVkLAo+ICAgICAgcWVtdV9lZGlkX2luZm8gZWRpZCA9IHsKPiAgICAgICAgICAubWF4
eCAgPSBkcHktPmVkaWRfcmVncy0+bWF4X3hyZXMsCj4gICAgICAgICAgLm1heHkgID0gZHB5LT5l
ZGlkX3JlZ3MtPm1heF95cmVzLAo+IC0gICAgICAgIC5wcmVmeCA9IHByZWZ4LAo+IC0gICAgICAg
IC5wcmVmeSA9IHByZWZ5LAo+ICsgICAgICAgIC5wcmVmeCA9IHByZWZ4ID86IHZkZXYtPmRpc3Bs
YXlfeHJlcywKPiArICAgICAgICAucHJlZnkgPSBwcmVmeSA/OiB2ZGV2LT5kaXNwbGF5X3lyZXMs
Cj4gICAgICB9Owo+ICAKPiAgICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19E
RVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsKPiBAQCAtMTE3LDYgKzExNywxMCBAQCBzdGF0aWMg
dm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KFZGSU9QQ0lEZXZpY2UgKnZkZXYpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19SRUdJT05fU1VCVFlQRV9HRlhfRURJ
RCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZHB5LT5lZGlkX2luZm8p
Owo+ICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgIGlmICh2ZGV2LT5kaXNwbGF5X3hyZXMgfHwg
dmRldi0+ZGlzcGxheV95cmVzKSB7Cj4gKyAgICAgICAgICAgIHdhcm5fcmVwb3J0KCJ2ZmlvOiBu
byBlZGlkIHN1cHBvcnQgYXZhaWxhYmxlLCAiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICJ4
cmVzIGFuZCB5cmVzIHByb3BlcnRpZXMgaGF2ZSBubyBlZmZlY3QuIik7Cj4gKyAgICAgICAgfQoK
SW4gb3JkZXIgdG8gZ2V0IGhlcmUgdGhlIGRldmljZSBuZWVkcyB0byBoYXZlIGEgZGlzcGxheSBv
cHRpb24gc2V0IHRvCidvbicgb3IgJ2F1dG8nIGFuZCB0aGF0IGRpc3BsYXkgbmVlZHMgdG8gYmUg
YmFja2VkIGJ5IGEgZG1hYnVmIGdyYXBoaWNzCnBsYW5lLiAgVGhhdCBtZWFucyB0aGF0IFFFTVUg
aXMgaGFwcHkgdG8gcnVuIHdpdGhvdXQgYW55IHdhcm5pbmcgaWYgYQp1c2VyIHNldHMgYSByZXNv
bHV0aW9uIG9uIGEgcmVnaW9uIGJhY2tlZCBkaXNwbGF5LCBvciBhIGRldmljZSB3aXRob3V0CmEg
ZGlzcGxheS4gIEkgdGhpbmsgdGhhdCBRRU1VIHNob3VsZCBwcm9iYWJseSBmYWlsLCBub3QganVz
dCB3YXJuLCBmb3IKYWxsIGNhc2VzIHdoZXJlIGFuIG9wdGlvbiBpcyBub3QgYXBwcm9wcmlhdGUg
Zm9yIGEgZGV2aWNlLiAgUGVyaGFwcwpFRElEIHNldHVwIHNob3VsZCBzZXQgYSBmZWF0dXJlIGJp
dCBvciBmbGFnIHRoYXQgd2UgY2FuIHRlc3Qgc2ltaWxhciB0bwpob3cgYW5kIHdoZXJlIHdlIHRl
c3QgZm9yIGEgc3RyYXkgcmFtZmIgb3B0aW9uLgoKPiAgICAgICAgICByZXR1cm47Cj4gICAgICB9
Cj4gIAo+IEBAIC0xMjgsNiArMTMyLDE0IEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlk
X2luaXQoVkZJT1BDSURldmljZSAqdmRldikKPiAgICAgIHByZWFkX2ZpZWxkKGZkLCBkcHktPmVk
aWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIG1heF95cmVzKTsKPiAgICAgIGRweS0+ZWRpZF9ibG9i
ID0gZ19tYWxsb2MwKGRweS0+ZWRpZF9yZWdzLT5lZGlkX21heF9zaXplKTsKPiAgCj4gKyAgICAv
KiBpZiB4cmVzICsgeXJlcyBwcm9wZXJ0aWVzIGFyZSB1bnNldCB1c2UgdGhlIG1heGltdW0gcmVz
b2x1dGlvbiAqLwo+ICsgICAgaWYgKCF2ZGV2LT5kaXNwbGF5X3hyZXMpIHsKPiArICAgICAgICB2
ZGV2LT5kaXNwbGF5X3hyZXMgPSBkcHktPmVkaWRfcmVncy0+bWF4X3hyZXM7Cj4gKyAgICB9Cj4g
KyAgICBpZiAoIXZkZXYtPmRpc3BsYXlfeXJlcykgewo+ICsgICAgICAgIHZkZXYtPmRpc3BsYXlf
eXJlcyA9IGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJlczsKPiArICAgIH0KPiArCj4gICAgICB2Zmlv
X2Rpc3BsYXlfZWRpZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwgMCk7Cj4gICAgICByZXR1cm47Cj4g
IAo+IGRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5jIGIvaHcvdmZpby9wY2kuYwo+IGluZGV4IGRk
MTJmMzYzOTEuLmVkYjgzOTQwMzggMTAwNjQ0Cj4gLS0tIGEvaHcvdmZpby9wY2kuYwo+ICsrKyBi
L2h3L3ZmaW8vcGNpLmMKPiBAQCAtMzE4Miw2ICszMTgyLDggQEAgc3RhdGljIFByb3BlcnR5IHZm
aW9fcGNpX2Rldl9wcm9wZXJ0aWVzW10gPSB7Cj4gICAgICBERUZJTkVfUFJPUF9TVFJJTkcoInN5
c2ZzZGV2IiwgVkZJT1BDSURldmljZSwgdmJhc2VkZXYuc3lzZnNkZXYpLAo+ICAgICAgREVGSU5F
X1BST1BfT05fT0ZGX0FVVE8oImRpc3BsYXkiLCBWRklPUENJRGV2aWNlLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGlzcGxheSwgT05fT0ZGX0FVVE9fT0ZGKSwKPiArICAgIERFRklO
RV9QUk9QX1VJTlQzMigieHJlcyIsIFZGSU9QQ0lEZXZpY2UsIGRpc3BsYXlfeHJlcywgMCksCj4g
KyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInlyZXMiLCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3ly
ZXMsIDApLAoKVGhpcyBpcyBhY3R1YWxseSBxdWl0ZSBmdW4sIEkgc3RhcnRlZCBteSBWTSB3aXRo
IGFyYml0cmFyeSBudW1iZXJzIGFuZAp0aGUgV2luZG93cyBHVUkgaG9ub3JlZCBpdCBldmVyeSB0
aW1lLiAgUHJvYmFibHkgdmVyeSB1c2VmdWwgZm9yCnBsYXlpbmcgd2l0aCBvZGQgc2NyZWVuIHNp
emVzLiAgSSBhbHNvIHRyaWVkIHRvIGJyZWFrIGl0IHVzaW5nCjEwMDAwMDB4MTAwMDAwMCwgYnV0
IHRoZSBkaXNwbGF5IGNhbWUgdXAgYXMgMTkyMHgxMjAwLCB0aGUgbWF4aW11bQpyZXNvbHV0aW9u
IEdWVC1nIHN1cHBvcnRzIGZvciB0aGlzIHR5cGUuICBJIGRvbid0IHNlZSB0aGF0IFFFTVUgaXMK
Ym91bmRpbmcgdGhpcyB0aG91Z2gsIGRvIHdlIGRlcGVuZCBvbiB0aGUgbWRldiBkZXZpY2UgdG8g
aWdub3JlIGl0IGlmCndlIHBhc3MgdmFsdWVzIGl0IGNhbm5vdCBzdXBwb3J0PyAgVGhhbmtzLAoK
QWxleAoKPiAgICAgIERFRklORV9QUk9QX1VJTlQzMigieC1pbnR4LW1tYXAtdGltZW91dC1tcyIs
IFZGSU9QQ0lEZXZpY2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50eC5tbWFwX3RpbWVv
dXQsIDExMDApLAo+ICAgICAgREVGSU5FX1BST1BfQklUKCJ4LXZnYSIsIFZGSU9QQ0lEZXZpY2Us
IGZlYXR1cmVzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
