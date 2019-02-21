Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5198510ywa;
        Wed, 20 Feb 2019 21:46:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZYPE/s8gQhc113X8PF8mJQZO8LgIQQR/N5HR/VuWvFJVXB69gFXOKG5g8Xilqdvnhydusp
X-Received: by 2002:a17:902:449:: with SMTP id 67mr40915518ple.310.1550728016296;
        Wed, 20 Feb 2019 21:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550728016; cv=none;
        d=google.com; s=arc-20160816;
        b=Ttyq06mWMUrRYp+X7DqltcOTL1Zxp4sP07FJMlr7a9yeiQjqxohEh3NNw7MKt1ni7D
         UHPEPt87zFJdzK2/WD3k+f9SnGoH3nIR191G5TzplsO4+R1zMAjqcJDObYi5IIMz8v/C
         HBbOwVOP6jdJToWLp8YXMrq016s4PflydMNXTgekV1H0sHH8jzxDggvRNM41w+jXbN/d
         zUw2NZi/dt/1g7tKZEM6XVoGsrrOGLQHUIHoXh8M6RHin/yEAzKZeQ6o4JKPwYSB2l5g
         jN+m3X8fkVpuL3dOSKvEu6bubLGVhzCYyvXHf/nDW18Z3/zYm7QbMTZ2ABtZtMA8bMab
         YOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=yENRfwDSwoAOt3DkItmH7eQ7AemuTrON18P+LpA+vyk=;
        b=Nm7pQAvSb2BqZ46ln7z4YhzX4fdjNV2EzSXRVW8lL4vATSfijA5AhznLjTDpDLaPR1
         AySYBQOxBzERH72A3SfrqwEvRtbXz+RqLesaYeBiEifgukJ1X3Ryr6E/Z8QvmuOt0sZx
         +eXvNEEMmPZ2H1z46abzaIpPyP6m6zW42KaFJj9knzZwNHnbo5kGGBv/1miD7r7Q/jFh
         VRNd3rKUzsZ/1dt8tbi6wFNZG47ca3VV0HASqt5oiJBLUXjQSrvzxvlmdH+53BWnjvUB
         eszp11vZfBnFxpxw7bAHLcuKlIWBKY/81j2BlvBksG8XxyMSoC08whKiHx7ki/ImXmlR
         hrmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r16si13273800pgm.483.2019.02.20.21.46.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 21:46:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A5489320;
	Thu, 21 Feb 2019 05:46:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487B389320
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 05:46:53 +0000 (UTC)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 53DF6A7EF05638FC5FE8;
 Thu, 21 Feb 2019 13:46:50 +0800 (CST)
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.219]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0415.000;
 Thu, 21 Feb 2019 13:46:49 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBEPflC1EqF60+uk2xDUf0AkqXoj98AgABRUwCAAJEagP//iSGAgACcDcD//4gsgIAAn79Q
Date: Thu, 21 Feb 2019 05:46:48 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB260AB2@dggeml511-mbx.china.huawei.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221015837.GK16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E834@dggeml511-mbx.china.huawei.com>
 <20190221040815.GN16456@joy-OptiPlex-7040>
In-Reply-To: <20190221040815.GN16456@joy-OptiPlex-7040>
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
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CgoKCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFpoYW8gWWFuIFttYWls
dG86eWFuLnkuemhhb0BpbnRlbC5jb21dCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIxLCAy
MDE5IDEyOjA4IFBNCj4gVG86IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNv
bT4KPiBDYzogY2ppYUBudmlkaWEuY29tOyBrdm1Admdlci5rZXJuZWwub3JnOyBhaWtAb3psYWJz
LnJ1Owo+IFpoZW5neGlhby56eEBBbGliYWJhLWluYy5jb207IHNodWFuZ3RhaS50c3RAYWxpYmFi
YS1pbmMuY29tOwo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsga3dhbmtoZWRlQG52aWRpYS5jb207
IGVhdWdlckByZWRoYXQuY29tOwo+IHlpLmwubGl1QGludGVsLmNvbTsgZXNrdWx0ZXRAcmVkaGF0
LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0Bs
aW51eC5pYm0uY29tOyBmZWxpcGVAbnV0YW5peC5jb207Cj4gS2VuLlh1ZUBhbWQuY29tOyBrZXZp
bi50aWFuQGludGVsLmNvbTsgZGdpbGJlcnRAcmVkaGF0LmNvbTsKPiBhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbTsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4gY2hhbmdw
ZW5nLmxpdUBpbnRlbC5jb207IGNvaHVja0ByZWRoYXQuY29tOyB6aGkuYS53YW5nQGludGVsLmNv
bTsKPiBqb25hdGhhbi5kYXZpZXNAbnV0YW5peC5jb20KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAv
NV0gUUVNVSBWRklPIGxpdmUgbWlncmF0aW9uCj4gCj4gT24gVGh1LCBGZWIgMjEsIDIwMTkgYXQg
MDM6MzM6MjRBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkgd3JvdGU6Cj4gPgo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBaaGFvIFlhbiBbbWFpbHRvOnlhbi55Lnpo
YW9AaW50ZWwuY29tXQo+ID4gPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjEsIDIwMTkgOTo1
OSBBTQo+ID4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29tPgo+
ID4gPiBDYzogYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
ZzsKPiA+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoZW5neGlhby56
eEBBbGliYWJhLWluYy5jb207Cj4gPiA+IHlpLmwubGl1QGludGVsLmNvbTsgZXNrdWx0ZXRAcmVk
aGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiA+ID4gY29odWNrQHJlZGhhdC5jb207IHNo
dWFuZ3RhaS50c3RAYWxpYmFiYS1pbmMuY29tOwo+IGRnaWxiZXJ0QHJlZGhhdC5jb207Cj4gPiA+
IHpoaS5hLndhbmdAaW50ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51eC5p
Ym0uY29tOwo+ID4gPiBhaWtAb3psYWJzLnJ1OyBlYXVnZXJAcmVkaGF0LmNvbTsgZmVsaXBlQG51
dGFuaXguY29tOwo+ID4gPiBqb25hdGhhbi5kYXZpZXNAbnV0YW5peC5jb207IGNoYW5ncGVuZy5s
aXVAaW50ZWwuY29tOwo+IEtlbi5YdWVAYW1kLmNvbTsKPiA+ID4ga3dhbmtoZWRlQG52aWRpYS5j
b207IGtldmluLnRpYW5AaW50ZWwuY29tOyBjamlhQG52aWRpYS5jb207Cj4gPiA+IGt2bUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIFFFTVUgVkZJTyBsaXZl
IG1pZ3JhdGlvbgo+ID4gPgo+ID4gPiBPbiBUaHUsIEZlYiAyMSwgMjAxOSBhdCAwMTozNTo0M0FN
ICswMDAwLCBHb25nbGVpIChBcmVpKSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gRnJvbTogWmhhbyBZYW4gW21haWx0
bzp5YW4ueS56aGFvQGludGVsLmNvbV0KPiA+ID4gPiA+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFy
eSAyMSwgMjAxOSA4OjI1IEFNCj4gPiA+ID4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29u
Z2xlaUBodWF3ZWkuY29tPgo+ID4gPiA+ID4gQ2M6IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29t
OyBxZW11LWRldmVsQG5vbmdudS5vcmc7Cj4gPiA+ID4gPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgWmhlbmd4aWFvLnp4QEFsaWJhYmEtaW5jLmNvbTsKPiA+ID4gPiA+IHlp
LmwubGl1QGludGVsLmNvbTsgZXNrdWx0ZXRAcmVkaGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNv
bTsKPiA+ID4gPiA+IGNvaHVja0ByZWRoYXQuY29tOyBzaHVhbmd0YWkudHN0QGFsaWJhYmEtaW5j
LmNvbTsKPiA+ID4gZGdpbGJlcnRAcmVkaGF0LmNvbTsKPiA+ID4gPiA+IHpoaS5hLndhbmdAaW50
ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51eC5pYm0uY29tOwo+ID4gPiA+
ID4gYWlrQG96bGFicy5ydTsgZWF1Z2VyQHJlZGhhdC5jb207IGZlbGlwZUBudXRhbml4LmNvbTsK
PiA+ID4gPiA+IGpvbmF0aGFuLmRhdmllc0BudXRhbml4LmNvbTsgY2hhbmdwZW5nLmxpdUBpbnRl
bC5jb207Cj4gPiA+IEtlbi5YdWVAYW1kLmNvbTsKPiA+ID4gPiA+IGt3YW5raGVkZUBudmlkaWEu
Y29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlkaWEuY29tOwo+ID4gPiA+ID4ga3Zt
QHZnZXIua2VybmVsLm9yZwo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIFFFTVUg
VkZJTyBsaXZlIG1pZ3JhdGlvbgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdlZCwgRmViIDIwLCAy
MDE5IGF0IDExOjU2OjAxQU0gKzAwMDAsIEdvbmdsZWkgKEFyZWkpIHdyb3RlOgo+ID4gPiA+ID4g
PiBIaSB5YW4sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciB3b3JrLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGhhdmUgc29tZSBzdWdnZXN0aW9ucyBvciBxdWVzdGlv
bnM6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IDEpIFdvdWxkIHlvdSBhZGQgbXNpeCBtb2RlIHN1
cHBvcnQsPyBpZiBub3QsIHBscyBhZGQgYSBjaGVjayBpbgo+ID4gPiA+ID4gdmZpb19wY2lfc2F2
ZV9jb25maWcoKSwgbGlrZXMgTnZpZGlhJ3Mgc29sdXRpb24uCj4gPiA+ID4gPiBvay4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IDIpIFdlIHNob3VsZCBzdGFydCB2ZmlvIGRldmljZXMgYmVmb3JlIHZj
cHUgcmVzdW1lcywgc28gd2UgY2FuJ3QgcmVseQo+IG9uCj4gPiA+IHZtCj4gPiA+ID4gPiBzdGFy
dCBjaGFuZ2UgaGFuZGxlciBjb21wbGV0ZWx5Lgo+ID4gPiA+ID4gdmZpbyBkZXZpY2VzIGlzIGJ5
IGRlZmF1bHQgc2V0IHRvIHJ1bm5pbmcgc3RhdGUuCj4gPiA+ID4gPiBJbiB0aGUgdGFyZ2V0IG1h
Y2hpbmUsIGl0cyBzdGF0ZSB0cmFuc2l0aW9uIGZsb3cgaXMKPiBydW5uaW5nLT5zdG9wLT5ydW5u
aW5nLgo+ID4gPiA+Cj4gPiA+ID4gVGhhdCdzIGNvbmZ1c2luZy4gV2Ugc2hvdWxkIHN0YXJ0IHZm
aW8gZGV2aWNlcyBhZnRlciB2ZmlvX2xvYWRfc3RhdGUsCj4gPiA+IG90aGVyd2lzZQo+ID4gPiA+
IGhvdyBjYW4geW91IGtlZXAgdGhlIGRldmljZXMnIGluZm9ybWF0aW9uIGFyZSB0aGUgc2FtZSBi
ZXR3ZWVuIHNvdXJjZQo+IHNpZGUKPiA+ID4gPiBhbmQgZGVzdGluYXRpb24gc2lkZT8KPiA+ID4g
Pgo+ID4gPiBzbywgeW91ciBtZWFuaW5nIGlzIHRvIHNldCBkZXZpY2Ugc3RhdGUgdG8gcnVubmlu
ZyBpbiB0aGUgZmlyc3QgY2FsbCB0bwo+ID4gPiB2ZmlvX2xvYWRfc3RhdGU/Cj4gPiA+Cj4gPiBO
bywgaXQgc2hvdWxkIHN0YXJ0IGRldmljZXMgYWZ0ZXIgdmZpb19sb2FkX3N0YXRlIGFuZCBiZWZv
cmUgdmNwdSByZXN1bWluZy4KPiA+Cj4gCj4gV2hhdCBhYm91dCBzZXQgZGV2aWNlIHN0YXRlIHRv
IHJ1bm5pbmcgaW4gbG9hZF9jbGVhbnVwIGhhbmRsZXIgPwo+IAoKVGhlIHRpbWluZyBpcyBmaW5l
LCBidXQgeW91IHNob3VsZCBhbHNvIHRoaW5rIGFib3V0IGlmIHNob3VsZCBzZXQgZGV2aWNlIHN0
YXRlIAp0byBydW5uaW5nIGluIGZhaWx1cmUgYnJhbmNoZXMgd2hlbiBjYWxsaW5nIGxvYWRfY2xl
YW51cCBoYW5kbGVyLgoKUmVnYXJkcywKLUdvbmdsZWkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
