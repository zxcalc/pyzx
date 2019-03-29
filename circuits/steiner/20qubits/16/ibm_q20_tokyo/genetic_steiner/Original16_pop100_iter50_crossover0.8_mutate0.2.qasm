// Initial wiring: [10, 8, 9, 18, 17, 7, 3, 13, 15, 14, 19, 12, 1, 5, 0, 6, 4, 2, 16, 11]
// Resulting wiring: [10, 8, 9, 18, 17, 7, 3, 13, 15, 14, 19, 12, 1, 5, 0, 6, 4, 2, 16, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[3];
cx q[11], q[10];
cx q[11], q[8];
cx q[13], q[6];
cx q[6], q[5];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[16], q[13];
cx q[13], q[12];
cx q[18], q[12];
cx q[12], q[7];
cx q[7], q[2];
cx q[18], q[19];
cx q[17], q[18];
cx q[16], q[17];
cx q[17], q[18];
cx q[5], q[14];
cx q[0], q[9];
cx q[0], q[1];
