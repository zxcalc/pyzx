// Initial wiring: [0 1 2 8 4 5 6 7 3]
// Resulting wiring: [0 1 2 7 4 5 6 8 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[3], q[4];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[4], q[7];
