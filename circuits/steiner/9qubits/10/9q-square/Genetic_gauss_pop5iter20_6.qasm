// Initial wiring: [5 1 2 8 4 0 6 7 3]
// Resulting wiring: [4 1 2 8 3 0 7 6 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[8], q[7];
cx q[7], q[4];
cx q[4], q[7];
cx q[6], q[5];
cx q[1], q[4];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[7];
cx q[1], q[2];
cx q[4], q[3];
