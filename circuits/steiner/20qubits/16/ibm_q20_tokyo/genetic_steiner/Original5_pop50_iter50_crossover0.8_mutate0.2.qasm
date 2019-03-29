// Initial wiring: [2, 17, 14, 9, 19, 15, 1, 13, 12, 0, 8, 18, 7, 10, 16, 5, 4, 6, 3, 11]
// Resulting wiring: [2, 17, 14, 9, 19, 15, 1, 13, 12, 0, 8, 18, 7, 10, 16, 5, 4, 6, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[12];
cx q[13], q[7];
cx q[13], q[6];
cx q[14], q[13];
cx q[14], q[5];
cx q[18], q[17];
cx q[18], q[12];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[10];
cx q[15], q[16];
cx q[14], q[15];
cx q[13], q[15];
cx q[13], q[14];
cx q[6], q[13];
cx q[13], q[14];
cx q[4], q[6];
