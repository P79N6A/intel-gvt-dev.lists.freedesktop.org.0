Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1045768ywb;
        Thu, 21 Mar 2019 13:03:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx25U+fSuS4V0BnNaFjaDF6owfBWrLzXZYXqigSWcEPq8BRfiA13J5nYRSqanfDymusKYt3
X-Received: by 2002:a17:902:be09:: with SMTP id r9mr5407121pls.189.1553198600176;
        Thu, 21 Mar 2019 13:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553198600; cv=none;
        d=google.com; s=arc-20160816;
        b=YlYISHiDhmfGlU+Aq+1Y7gaQpbT6bLFRmgGhM6cdFMINewDWOnu0OwThMd4KweKcTi
         9cWdgSe07VzSoxni3s8anaqIRJHcaw3lfrO95QU/EEKxZnrj1VemxPfQDyqlk3QNUgNW
         2wHNqMQrUvWDMzIfe1brI3/qIhrxyBskmRfD+fT+tld28l23WO5r5O1nkck4yZGu/SO9
         jtrrEGGOpzPf7AHQpWDs9PQVW689n85O7vohI+8MBXEak9wGeM2wWz3ZtZmQ2ERuhr7F
         Qq7kuRy16bgF/RGJOn4QlSqX20ELsLmWoNlISIjnLNp83SuApq8Lkkul3ICoeM274CmW
         eq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=1GVXVAqbEZICj87v8faUjOmQDfjnO3+2yN8dmNSDjcU=;
        b=ZqzGzg7JEFa0sKuNLUH0qzJVmaq9ubcU5q0qDcqPbUujbNFU6ZrURQpVD3KKEVuchJ
         hEiQDLh6H+wvqNoPJLxrkn0RbHZ52Daks4PC+WVADhfknF0eiRpyx/7gHDAMttDxaO0B
         1IkzuMG20qltP/V7HZyHwpauc5/DAE7rMzTQVP8cenywRwTdvy2kKa411F+t/awCgt6V
         n5Ing2DSF69Vz/EoRDPXUnK0lgrgawBI87lddA4ccTnyL6ZFMmB0EXO5LbYHafnKeLJv
         xjDPkrsFRuB35mE1KrRrz/zA4Vzo4LDxNdslId/81T3+8xyVqHRX4I4tlID9B0HRVwL3
         5DBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a4si4728213pgq.471.2019.03.21.13.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 13:03:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA756E1B2;
	Thu, 21 Mar 2019 20:03:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE746E194;
 Thu, 21 Mar 2019 20:03:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 13:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,254,1549958400"; d="scan'208";a="309246324"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2019 13:03:16 -0700
Date: Thu, 21 Mar 2019 13:03:30 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190321200330.GB28473@intel.com>
References: <20190321035018.GF10798@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190321035018.GF10798@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjEsIDIwMTkgYXQgMTE6NTA6MThBTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gU29ycnkgdGhhdCBJIG1pZ2h0IG1pc3MgNS4xLXJjMSB3aW5kb3cg
YXMgSSB3YXMgaW4gZnVsbCBkYXkgZXZlbnQKPiBkdXJpbmcgdGhpcyB3ZWVrLgoKaG1tLi4uIG15
IGJhZC4gSSBzaG91bGQgaGFkIHJlbWVtYmVyZWQgdGhhdCB5b3UgaGFkIHN0dWZmIHF1ZXVlZCBm
b3IKLWZpeGVzIHRoYXQgd2UgZGlkbid0IHB1dCBpbiAtbmV4dC1maXhlcy4uLi4KCkknbSBzb3Jy
eS4KCj4gSGVyZSdzIHJlLWdlbmVyYXRlZCBndnQtZml4ZXMgYWdhaW5zdAo+IGRybS1pbnRlbC1m
aXhlcy4gVGhpcyBjb250YWlucyBmaXhlcyBmb3IgbmV3ZXIgdmVyc2lvbiBvZiBXaW5kb3dzCj4g
ZHJpdmVyLCBlLmcgZml4aW5nIHBhcnNlciBmb3IgTUlfRkxVU0hfRFcgY29tbWFuZCBhbmQgZml4
ZWQgd2luZG93cwo+IGZvbnQgcmVuZGVyIGVycm9yLCB3aXRoIG90aGVyIHN0YWJsZSBmaXggaW4g
ZXJyb3IgcGF0aCwgYW5kIGZpeAo+IHVuZXhwZWN0ZWQgd29ya2xvYWQgc3VibWlzc2lvbiB3aGVu
IHZHUFUgaWRsZSwgZXRjLiBEZXRhaWxzIGFyZSBiZWxvdy4KCnB1bGxlZCB0byBkcm0taW50ZWwt
Zml4ZXMgbm93LCBidXQgdGhpcyBpcyBwcm9iYWJseSBqdXN0IGdvaW5nIHVwCm5leHQgd2Vlay4K
ClRoYW5rcywKUm9kcmlnby4KCj4gCj4gVGhhbmtzIQo+IC0tCj4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCAwZjc1NTUxMjE2MDkxMjIzZWZlMWYxODI5NWY2NTVhZmY2NDE1Mzg1
Ogo+IAo+ICAgZHJtL2k5MTUvZ3Z0OiByZWxlYXNlIHNoYWRvdyBiYXRjaCBidWZmZXIgYW5kIHdh
X2N0eCBiZWZvcmUgZGVzdHJveSBvbmUgd29ya2xvYWQgKDIwMTktMDEtMjMgMTM6NTg6NDYgKzA4
MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1maXhlcy0yMDE5
LTAzLTIxCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDcyYWFiZmI4NjJlNDBl
ZTgzYzEzNmM0Zjg3ODc3YzIwN2U2ODU5Yjc6Cj4gCj4gICBkcm0vaTkxNS9ndnQ6IEFkZCBtdXR1
YWwgbG9jayBmb3IgcHBndHQgbW0gTFJVIGxpc3QgKDIwMTktMDMtMDQgMTQ6NDU6MjggKzA4MDAp
Cj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IGd2dC1maXhlcy0yMDE5LTAzLTIxCj4gCj4gLSBGaXggTUlfRkxVU0hf
RFcgY21kIHBhcnNlciBvbiBpbmRleCBjaGVjayAoWmhlbnl1KQo+IC0gRml4IFdpbmRvd3MgZ3Vl
c3QgZm9udCByZW5kZXIgZXJyb3IgKENvbGluKQo+IC0gRml4IHVuZXhwZWN0ZWQgd29ya2xvYWQg
c3VibWlzc2lvbiBmb3IgaW5hY3RpdmUgdkdQVSAoV2VpbmFuKQo+IC0gRml4IGluY29ycmVjdCB3
b3JrbG9hZCBzdWJtaXNzaW9uIGluIGVycm9yIHBhdGggKFpoZW55dSkKPiAtIEZpeCB3YXJuaW5n
IGZvciBzaGFkb3cgcHBndHQgbW0gcmVjbGFpbSBsaXN0IHdhbGsgd2l0aCBsb2NraW5nIChaaGVu
eXUpCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IENvbGluIFh1ICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEFk
ZCBpbiBjb250ZXh0IG1taW8gMHgyMEQ4IHRvIGdlbjkgbW1pbyBsaXN0Cj4gCj4gV2VpbmFuIExp
ICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IHN0b3Agc2NoZWR1bGluZyB3b3JrbG9hZCB3aGVu
IHZncHUgaXMgaW5hY3RpdmUKPiAKPiBaaGVueXUgV2FuZyAoNCk6Cj4gICAgICAgZHJtL2k5MTUv
Z3Z0OiBGaXggTUlfRkxVU0hfRFcgcGFyc2luZyB3aXRoIGNvcnJlY3QgaW5kZXggY2hlY2sKPiAg
ICAgICBkcm0vaTkxNS9ndnQ6IERvbid0IHN1Ym1pdCByZXF1ZXN0IGZvciBlcnJvciB3b3JrbG9h
ZCBkaXNwYXRjaAo+ICAgICAgIGRybS9pOTE1L2d2dDogT25seSBhc3NpZ24gcHBndHQgcm9vdCBh
dCBkaXNwYXRjaCB0aW1lCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGQgbXV0dWFsIGxvY2sgZm9y
IHBwZ3R0IG1tIExSVSBsaXN0Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFy
c2VyLmMgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAg
ICB8IDE0ICsrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCAg
ICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5j
IHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgICAgfCAyOCAr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9n
eSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5l
dCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
