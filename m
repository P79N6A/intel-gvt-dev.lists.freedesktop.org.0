Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5116698ywa;
        Wed, 20 Feb 2019 19:33:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaGrk3+yeuwCmMHJmAKpn7uASsCQG1zQ3vm/YNU7FHjIiOeENzY44yprt6O4q8INc2Kr2wZ
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr40564220plo.50.1550720016648;
        Wed, 20 Feb 2019 19:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550720016; cv=none;
        d=google.com; s=arc-20160816;
        b=djkjmjQfgZ5m3WIcagXpFiJwC0XO6LTSt5bWwMY1NdqPIvj4w3E4Ym2ZbxUwfNoU5+
         1gY3oylwsBUPziPLpEtl7gONdP891tdj8c7QT5g6plkZ8AGVOh0O7E1Z5KE029VeiQyp
         G9Odn7uH5PGsrJ08PVt6cJzBd9Mx2BkvWkDsoZ9jTwwSsL47Cskhzc9fVSwbBCo1PBCh
         +2ZgpgN0EZrmdCisKZiTj3pT6loNNH35PqPqJhG0B8blcWgetYGnmP/nwovuAfBN4vs1
         eeBcLyY8BJ9NGOnISF8uLwuBc3aOhotq1lfwwyt2p2fC0aObDRJnpj4dOHSSHAOLgwN7
         DGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=1aohA09FwG9uVLYpCUklHrNXJI1Bp/LRBXK+AdyaacI=;
        b=VvoLsibcQ9gYsuBG/kZsRw75iwE+iyJS/GduBhzkpy69yabZrsZtm0wthkA6mwGOyQ
         o3eymVojRrsS2SmneGOPN62HWrV8lvUoKY+g+nUsroP6bUOannL5EPRxMHi60lGZjoBO
         TJaKqnJQVmk20iqxXbCvPolrNFEXXf5WpJR1W5UfROc067axBnGtwVJug4665vwx1dbb
         A38puyNHwva1JWrr3kyhhCQi5Jux6pD9iLbCgFKx4EzCl3JH5+PgXbg/NXXuQ1qZu8T6
         ahkAVNUSpgexQiFs26718cOvYr3F5sUc+kjwnihOThytU5G/5Fnkwc/nJKqq8Yg3erOX
         tI5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v6si3627732plo.129.2019.02.20.19.33.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 19:33:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9FE892AC;
	Thu, 21 Feb 2019 03:33:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E77892AC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 03:33:33 +0000 (UTC)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id D21846B6467B21AD9403;
 Thu, 21 Feb 2019 11:33:30 +0800 (CST)
Received: from DGGEML421-HUB.china.huawei.com (10.1.199.38) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 21 Feb 2019 11:33:30 +0800
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.219]) by
 dggeml421-hub.china.huawei.com ([10.1.199.38]) with mapi id 14.03.0415.000;
 Thu, 21 Feb 2019 11:33:24 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBEPflC1EqF60+uk2xDUf0AkqXoj98AgABRUwCAAJEagP//iSGAgACcDcA=
Date: Thu, 21 Feb 2019 03:33:24 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB25E834@dggeml511-mbx.china.huawei.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221015837.GK16456@joy-OptiPlex-7040>
In-Reply-To: <20190221015837.GK16456@joy-OptiPlex-7040>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.18.62]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "ziye.yang@intel.com" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBaaGFvIFlhbiBbbWFpbHRvOnlh
bi55LnpoYW9AaW50ZWwuY29tXQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyMSwgMjAxOSA5
OjU5IEFNCj4gVG86IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4KPiBD
YzogYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsKPiBp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhlbmd4aWFvLnp4QEFsaWJhYmEt
aW5jLmNvbTsKPiB5aS5sLmxpdUBpbnRlbC5jb207IGVza3VsdGV0QHJlZGhhdC5jb207IHppeWUu
eWFuZ0BpbnRlbC5jb207Cj4gY29odWNrQHJlZGhhdC5jb207IHNodWFuZ3RhaS50c3RAYWxpYmFi
YS1pbmMuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOwo+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBt
bGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51eC5pYm0uY29tOwo+IGFpa0BvemxhYnMucnU7
IGVhdWdlckByZWRoYXQuY29tOyBmZWxpcGVAbnV0YW5peC5jb207Cj4gam9uYXRoYW4uZGF2aWVz
QG51dGFuaXguY29tOyBjaGFuZ3BlbmcubGl1QGludGVsLmNvbTsgS2VuLlh1ZUBhbWQuY29tOwo+
IGt3YW5raGVkZUBudmlkaWEuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlkaWEu
Y29tOwo+IGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0gUUVN
VSBWRklPIGxpdmUgbWlncmF0aW9uCj4gCj4gT24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDE6MzU6
NDNBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkgd3JvdGU6Cj4gPgo+ID4KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogWmhhbyBZYW4gW21haWx0bzp5YW4ueS56aGFv
QGludGVsLmNvbV0KPiA+ID4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIxLCAyMDE5IDg6MjUg
QU0KPiA+ID4gVG86IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4KPiA+
ID4gQ2M6IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBxZW11LWRldmVsQG5vbmdudS5vcmc7
Cj4gPiA+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGVuZ3hpYW8uenhA
QWxpYmFiYS1pbmMuY29tOwo+ID4gPiB5aS5sLmxpdUBpbnRlbC5jb207IGVza3VsdGV0QHJlZGhh
dC5jb207IHppeWUueWFuZ0BpbnRlbC5jb207Cj4gPiA+IGNvaHVja0ByZWRoYXQuY29tOyBzaHVh
bmd0YWkudHN0QGFsaWJhYmEtaW5jLmNvbTsKPiBkZ2lsYmVydEByZWRoYXQuY29tOwo+ID4gPiB6
aGkuYS53YW5nQGludGVsLmNvbTsgbWxldml0c2tAcmVkaGF0LmNvbTsgcGFzaWNAbGludXguaWJt
LmNvbTsKPiA+ID4gYWlrQG96bGFicy5ydTsgZWF1Z2VyQHJlZGhhdC5jb207IGZlbGlwZUBudXRh
bml4LmNvbTsKPiA+ID4gam9uYXRoYW4uZGF2aWVzQG51dGFuaXguY29tOyBjaGFuZ3BlbmcubGl1
QGludGVsLmNvbTsKPiBLZW4uWHVlQGFtZC5jb207Cj4gPiA+IGt3YW5raGVkZUBudmlkaWEuY29t
OyBrZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlkaWEuY29tOwo+ID4gPiBrdm1Admdlci5r
ZXJuZWwub3JnCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC81XSBRRU1VIFZGSU8gbGl2ZSBt
aWdyYXRpb24KPiA+ID4KPiA+ID4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMTE6NTY6MDFBTSAr
MDAwMCwgR29uZ2xlaSAoQXJlaSkgd3JvdGU6Cj4gPiA+ID4gSGkgeWFuLAo+ID4gPiA+Cj4gPiA+
ID4gVGhhbmtzIGZvciB5b3VyIHdvcmsuCj4gPiA+ID4KPiA+ID4gPiBJIGhhdmUgc29tZSBzdWdn
ZXN0aW9ucyBvciBxdWVzdGlvbnM6Cj4gPiA+ID4KPiA+ID4gPiAxKSBXb3VsZCB5b3UgYWRkIG1z
aXggbW9kZSBzdXBwb3J0LD8gaWYgbm90LCBwbHMgYWRkIGEgY2hlY2sgaW4KPiA+ID4gdmZpb19w
Y2lfc2F2ZV9jb25maWcoKSwgbGlrZXMgTnZpZGlhJ3Mgc29sdXRpb24uCj4gPiA+IG9rLgo+ID4g
Pgo+ID4gPiA+IDIpIFdlIHNob3VsZCBzdGFydCB2ZmlvIGRldmljZXMgYmVmb3JlIHZjcHUgcmVz
dW1lcywgc28gd2UgY2FuJ3QgcmVseSBvbgo+IHZtCj4gPiA+IHN0YXJ0IGNoYW5nZSBoYW5kbGVy
IGNvbXBsZXRlbHkuCj4gPiA+IHZmaW8gZGV2aWNlcyBpcyBieSBkZWZhdWx0IHNldCB0byBydW5u
aW5nIHN0YXRlLgo+ID4gPiBJbiB0aGUgdGFyZ2V0IG1hY2hpbmUsIGl0cyBzdGF0ZSB0cmFuc2l0
aW9uIGZsb3cgaXMgcnVubmluZy0+c3RvcC0+cnVubmluZy4KPiA+Cj4gPiBUaGF0J3MgY29uZnVz
aW5nLiBXZSBzaG91bGQgc3RhcnQgdmZpbyBkZXZpY2VzIGFmdGVyIHZmaW9fbG9hZF9zdGF0ZSwK
PiBvdGhlcndpc2UKPiA+IGhvdyBjYW4geW91IGtlZXAgdGhlIGRldmljZXMnIGluZm9ybWF0aW9u
IGFyZSB0aGUgc2FtZSBiZXR3ZWVuIHNvdXJjZSBzaWRlCj4gPiBhbmQgZGVzdGluYXRpb24gc2lk
ZT8KPiA+Cj4gc28sIHlvdXIgbWVhbmluZyBpcyB0byBzZXQgZGV2aWNlIHN0YXRlIHRvIHJ1bm5p
bmcgaW4gdGhlIGZpcnN0IGNhbGwgdG8KPiB2ZmlvX2xvYWRfc3RhdGU/Cj4gCk5vLCBpdCBzaG91
bGQgc3RhcnQgZGV2aWNlcyBhZnRlciB2ZmlvX2xvYWRfc3RhdGUgYW5kIGJlZm9yZSB2Y3B1IHJl
c3VtaW5nLgoKPiA+ID4gc28sIG1heWJlIHlvdSBjYW4gaWdub3JlIHRoZSBzdG9wIG5vdGlmaWNh
dGlvbiBpbiBrZXJuZWw/Cj4gPiA+ID4gMykgV2UnZCBiZXR0ZXIgc3VwcG9ydCBsaXZlIG1pZ3Jh
dGlvbiByb2xsYmFjayBzaW5jZSBoYXZlIG1hbnkgZmFpbHVyZQo+ID4gPiBzY2VuYXJpb3MsCj4g
PiA+ID4gIHJlZ2lzdGVyIGEgbWlncmF0aW9uIG5vdGlmaWVyIGlzIGEgZ29vZCBjaG9pY2UuCj4g
PiA+IEkgdGhpbmsgdGhpcyBwYXRjaHNldCBjYW4gYWxzbyBoYW5kbGUgdGhlIGZhaWx1cmUgY2Fz
ZSB3ZWxsLgo+ID4gPiBpZiBtaWdyYXRpb24gZmFpbHVyZSBvciBjYW5jZWxsaW5nIGhhcHBlbnMs
Cj4gPiA+IGluIGNsZWFudXAgaGFuZGxlciwgTE9HR0lORyBzdGF0ZSBpcyBjbGVhcmVkLiBkZXZp
Y2Ugc3RhdGUocnVubmluZyBvcgo+ID4gPiBzdG9wcGVkKSBrZWVwcyBhcyBpdCBpcykuCj4gPgo+
ID4gSUlSQyB0aGVyZSdyZSBtYW55IGZhaWx1cmUgcGF0aHMgZG9uJ3QgY2FsbGluZyBjbGVhbnVw
IGhhbmRsZXIuCj4gPgo+IGNvdWxkIHlvdSB0YWtlIGFuIGV4YW1wbGU/CgpOZXZlciBtaW5kLCB0
aGF0J3MgYW5vdGhlciBidWcgSSB0aGluay4gCgo+ID4gPiB0aGVuLAo+ID4gPiBpZiB2bSBzd2l0
Y2hlcyBiYWNrIHRvIHJ1bm5pbmcsIGRldmljZSBzdGF0ZSB3aWxsIGJlIHNldCB0byBydW5uaW5n
Owo+ID4gPiBpZiB2bSBzdGF5ZXMgYXQgc3RvcHBlZCBzdGF0ZSwgZGV2aWNlIHN0YXRlIGlzIGFs
c28gc3RvcHBlZCAoaXQgaGFzIG5vCj4gPiA+IG1lYW5pbmcgdG8gbGV0IGl0IGluIHJ1bm5pbmcg
c3RhdGUpLgo+ID4gPiBEbyB5b3UgdGhpbmsgc28gPwo+ID4gPgo+ID4gSUYgdGhlIHVuZGVybHlp
bmcgc3RhdGUgbWFjaGluZSBpcyBjb21wbGljYXRlZCwKPiA+IFdlIHNob3VsZCB0ZWxsIHRoZSBj
YW5jZWxpbmcgc3RhdGUgdG8gdmVuZG9yIGRyaXZlciBwcm9hY3RpdmVseS4KPiA+Cj4gVGhhdCBt
YWtlcyBzZW5zZS4KPiAKPiA+ID4gPiA0KSBGb3VyIG1lbW9yeSByZWdpb24gZm9yIGxpdmUgbWln
cmF0aW9uIGlzIHRvbyBjb21wbGljYXRlZCBJTUhPLgo+ID4gPiBvbmUgYmlnIHJlZ2lvbiByZXF1
aXJlcyB0aGUgc3ViLXJlZ2lvbnMgd2VsbCBwYWRkZWQuCj4gPiA+IGxpa2UgZm9yIHRoZSBmaXJz
dCBjb250cm9sIGZpZWxkcywgdGhleSBoYXZlIHRvIGJlIHBhZGRlZCB0byA0Sy4KPiA+ID4gdGhl
IHNhbWUgZm9yIG90aGVyIGRhdGEgZmllbGRzLgo+ID4gPiBPdGhlcndpc2UsIG1tYXAgc2ltcGx5
IGZhaWxzLCBiZWNhdXNlIHRoZSBzdGFydC1vZmZzZXQgYW5kIHNpemUgZm9yIG1tYXAKPiA+ID4g
Ym90aCBuZWVkIHRvIGJlIFBBR0UgYWxpZ25lZC4KPiA+ID4KPiA+IEJ1dCBpZiB3ZSBkb24ndCBu
ZWVkIHVzZSBtbWFwIGZvciBjb250cm9sIGZpbGVkIGFuZCBkZXZpY2Ugc3RhdGUsIHRoZXkgYXJl
Cj4gc21hbGwgYmFzaWNhbGx5Lgo+ID4gVGhlIHBlcmZvcm1hbmNlIGlzIGVub3VnaCB1c2luZyBw
cmVhZC9wd3JpdGUuCj4gPgo+IHdlIGRvbid0IG1tYXAgY29udHJvbCBmaWVsZHMuIGJ1dCBpZiBk
YXRhIGZpZWxkcyBnb2luZyBpbW1lZGF0ZWx5IGFmdGVyCj4gY29udHJvbCBmaWVsZHMgKGUuZy4g
anVzdCA2NCBieXRlcyksIHdlIGNhbid0IG1tYXAgZGF0YSBmaWVsZHMKPiBzdWNjZXNzZnVsbHkg
YmVjYXVzZSBpdHMgc3RhcnQgb2Zmc2V0IGlzIDY0LiBUaGVyZWZvcmUgY29udHJvbCBmaWVsZHMg
aGF2ZQo+IHRvIGJlIHBhZGRlZCB0byA0ayB0byBsZXQgZGF0YSBmaWVsZHMgc3RhcnQgZnJvbSA0
ay4KPiBUaGF0J3MgdGhlIGRyYXdiYWNrIG9mIG9uZSBiaWcgcmVnaW9uIGhvbGRpbmcgYm90aCBj
b250cm9sIGFuZCBkYXRhIGZpZWxkcy4KPiAKPiA+ID4gQWxzbywgNCByZWdpb25zIGlzIGNsZWFy
ZXIgaW4gbXkgdmlldyA6KQo+ID4gPgo+ID4gPiA+IDUpIEFib3V0IGxvZyBzeW5jLCB3aHkgbm90
IHJlZ2lzdGVyIGxvZ19nbG9iYWxfc3RhcnQvc3RvcCBpbgo+ID4gPiB2ZmlvX21lbW9yeV9saXN0
ZW5lcj8KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+IHNlZW1zIGxvZ19nbG9iYWxfc3RhcnQvc3RvcCBj
YW5ub3QgYmUgaXRlcmF0ZWx5IGNhbGxlZCBpbiBwcmUtY29weSBwaGFzZT8KPiA+ID4gZm9yIGRp
cnR5IHBhZ2VzIGluIHN5c3RlbSBtZW1vcnksIGl0J3MgYmV0dGVyIHRvIHRyYW5zZmVyIGRpcnR5
IGRhdGEKPiA+ID4gaXRlcmF0aXZlbHkgdG8gcmVkdWNlIGRvd24gdGltZSwgcmlnaHQ/Cj4gPiA+
Cj4gPgo+ID4gV2UganVzdCBuZWVkIGludm9raW5nIG9ubHkgb25jZSBmb3Igc3RhcnQgYW5kIHN0
b3AgbG9nZ2luZy4gV2h5IHdlIG5lZWQgdG8KPiBjYWxsCj4gPiB0aGVtIGxpdGVyYXRlbHk/IFNl
ZSBtZW1vcnlfbGlzdGVuZXIgb2Ygdmhvc3QuCj4gPgo+IAo+IAo+IAo+ID4gUmVnYXJkcywKPiA+
IC1Hb25nbGVpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
