// Initial wiring: [0 4 2 8 1 5 7 6 3]
// Resulting wiring: [0 4 2 7 1 5 8 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[7], q[8];
cx q[2], q[3];
cx q[7], q[4];
