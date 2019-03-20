// Initial wiring: [0 1 2 3 6 4 7 5 8]
// Resulting wiring: [0 1 2 8 5 4 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[4], q[1];
cx q[4], q[5];
cx q[5], q[4];
cx q[0], q[5];
cx q[3], q[4];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[0], q[5];
cx q[2], q[3];
