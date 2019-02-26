// Initial wiring: [1 5 3 2 4 0 6 7 8]
// Resulting wiring: [4 5 3 2 1 0 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[7], q[6];
cx q[7], q[4];
cx q[6], q[5];
cx q[3], q[4];
