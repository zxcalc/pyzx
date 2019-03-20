// Initial wiring: [0 1 2 8 4 5 7 3 6]
// Resulting wiring: [0 1 2 8 4 5 7 3 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[3], q[4];
cx q[7], q[8];
