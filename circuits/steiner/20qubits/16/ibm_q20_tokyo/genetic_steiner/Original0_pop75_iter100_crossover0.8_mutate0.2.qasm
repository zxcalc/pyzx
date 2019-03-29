// Initial wiring: [6, 11, 4, 15, 18, 9, 0, 14, 12, 7, 19, 13, 3, 16, 17, 5, 1, 2, 8, 10]
// Resulting wiring: [6, 11, 4, 15, 18, 9, 0, 14, 12, 7, 19, 13, 3, 16, 17, 5, 1, 2, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[8], q[7];
cx q[13], q[6];
cx q[13], q[7];
cx q[6], q[4];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[5];
cx q[14], q[13];
cx q[18], q[12];
cx q[18], q[19];
cx q[16], q[17];
cx q[12], q[17];
cx q[11], q[18];
cx q[6], q[7];
cx q[3], q[5];
cx q[0], q[1];
